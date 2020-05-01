class Api::V1::BaseController < RocketPants::Base
  version 1

  before_filter :authenticate_user_from_token!
  before_filter :require_authentication!
  before_filter :set_current_user

  def current_user
    @current_user
  end

  def require_authentication!
    error! :unauthenticated if current_user.nil?
  end

  def authenticate_user_from_token!
    @current_user = User.find_by_authentication_token(request.headers["token"])
    return false if @current_user.blank?
  end

  def set_current_user
    User.current = current_user
  end

end


