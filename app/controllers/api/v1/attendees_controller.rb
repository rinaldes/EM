class Api::V1::AttendeesController < Api::V1::BaseController

  def index
    event = Event.find(params[:event_id])
    if event.present?
      # expose event.attendees.page(params[:page]).per(API_PER_PAGE), :only => [:user_id, :event_id], :include => [ {:category => {:only => [:id, :name, :category_type]}}, :user => {:except => [:created_at, :updated_at, :is_admin, :authentication_token, :token] }]
      expose event.attendees.where(status: 'attended').page(params[:page]).per(API_PER_PAGE), each_serializer: AttendeeSerializer
    else
      expose error! :not_found
    end
  end

  def show
  	user = User.find(params[:id])
  	expose user, serializer: UserSerializer
  end

end
