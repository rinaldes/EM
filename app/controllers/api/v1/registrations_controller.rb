class Api::V1::RegistrationsController < Api::V1::BaseController
  def index
    attendee = Attendee.find_by_invitation_token_and_event_id(attendee_params[:qr_code], attendee_params[:event_id])
  	if attendee.present?
      render :status => 200, :json => {:status => 1, :message => "OK"}
    else
      render :status => 400, :json => {:error => "Device not registered."}
    end
  end

  def create
    attendee = Attendee.where(invitation_token: params[:invitation_token], event_id: params[:event_id]).first
    if attendee.present?
      attendee.update_attributes(:status => 'attended')
      expose status: 200
    else
      expose error! :not_found
    end
  end

end
