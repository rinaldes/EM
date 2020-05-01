class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_filter :require_authentication!,:only => [:create]

  def create
    user = User.find_for_authentication(email: user_params[:email])
    if user && user.valid_password?(user_params[:password])
      user.generate_authentication_token
      expose({
        user_id: user.id,
        token: user.authentication_token,
        name: user.name.try(:titleize),
        department: ( user.department.present? ? user.department : ""),
        phone: user.phone,
        email: user.email,
        avatar: user.avatar_url
      })
      user.save!
    else
      error! :unauthenticated
    end
  end

  private
    def user_params
      params.permit(:email, :password)
    end

end
