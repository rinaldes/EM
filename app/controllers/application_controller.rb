class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => 'pratesis', :password => '123456789' if Rails.env.production? || Rails.env.staging?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && action_name == "new"
      "session"
    else
      "application"
    end
  end
end