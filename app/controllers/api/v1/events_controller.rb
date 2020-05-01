class Api::V1::EventsController < Api::V1::BaseController
  def index
    events = current_user.is_admin? ? Event.all : current_user.attendees

    if events.present?
      # expose events.where.not(:status => 'created').page(params[:page]).per(API_PER_PAGE), :except => [:created_at, :updated_at], :include => [:event_size => {:only => [:id, :name]}]

      # expose events.page(params[:page]).per(API_PER_PAGE), :except => [:created_at, :updated_at], :include => [:event_size => {:only => [:id, :name]}]
      # expose events.page(params[:page]).per(API_PER_PAGE), each_serializer: EventSerializer 
        expose events.page(params[:page]).per(API_PER_PAGE), each_serializer:  (current_user.is_admin? ? AllEventSerializer : EventSerializer)
    else
      expose error! :not_found
    end
  end

  def indexx
    expose Event.all, each_serializer: EventSerializer
    # expose events.page(params[:page]).per(API_PER_PAGE)
  end

private

  def events
    {
      name:           "Perth Transit API",
      version:        1,
      documentation:  "http://doc.perthtransit.com/",
      endpoints: {
        train_stations: 'train_stations_url(version: 1)',
        bus_stops:      'bus_stops_url(version: 1)',
        train_station:  'train_station_url(":identifier", version: 1)',
        bus_stop:       'bus_stop_url(":identifier", version: 1)',
        smart_rider:    'smart_rider_url(":identifier", version: 1)'
      }
    }
  end

end
