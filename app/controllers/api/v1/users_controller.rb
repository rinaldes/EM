class Api::V1::UsersController < Api::V1::BaseController

  def update
    user = current_user
    if user.update_attributes(registration_id: user_params[:reg_id])
    expose status: 200
  else
      expose error! :not_found
    end

  end

  private
    def user_params
      params.permit(:reg_id)
    end

end
