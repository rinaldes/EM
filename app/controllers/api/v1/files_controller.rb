class Api::V1::FilesController < Api::V1::BaseController
  # before_filter :authenticate_attendee!
  # before_filter :require_authentication!

  # def authenticate_attendee!
  #   @current_attendee = Attendee.find_by_invitation_token_and_event_id(request.headers["token"], params[:event_id])
  #   return false if @current_attendee.blank?
  # end

  # def current_attendee
  #   @current_attendee
  # end

  # def require_authentication!
  #   error! :unauthenticated if current_attendee.nil?
  # end

  def index
  	# event_files = current_attendee.event.try(:event_files)
 	event = Event.find(params[:event_id])
    # if event_files.present?
    if event.present?
      # expose event_files.page(params[:page]).per(API_PER_PAGE), :only => :file
      expose event.event_files.page(params[:page]).per(API_PER_PAGE), each_serializer: EventFileSerializer
    else
      expose error! :not_found
    end
  end
end
