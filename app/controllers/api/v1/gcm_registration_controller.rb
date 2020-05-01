class Api::V1::GcmrRegistrationController < Api::V1::BaseController
  def update
    registration_id = params[:reg_id]

    if registration_id.blank?
      render :status => 400, :json => {:error => "Please Provide Registration ID."}
      return
    elsif params[:id].blank?
      render :status => 400, :json => {:error => "Please Provide User ID."}
      return
    end

    user = User.find_by_id(params[:id])
    if user.blank?
      render :status => 401, :json => { :error => "User not registered for id=#{params[:id]}." }
      return
    else
      if user.update_attribute("registration_id", registration_id)
        render :status => 200, :json => {:status => 1, :message => "OK"}
      else
        render :status => 500, :json => {:status => 0, :message => "failed"}
      end
    end
  end

  def create
    user = current_user
    if user.update_attribute(:registration_id => params[:reg_id])
    expose status: 200
  else
      expose error! :not_found
    end

  end

end
