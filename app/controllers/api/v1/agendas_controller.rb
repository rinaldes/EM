class Api::V1::AgendasController < Api::V1::BaseController
  def index
    event = Event.find(params[:event_id])
    if event.present?
      # expose event.agendas.page(params[:page]).per(API_PER_PAGE), :except => [:created_at, :updated_at, :status], :include => { :programmes => { :only => [:id, :agenda_id, :title, :start_time, :end_time, :description] } }
      expose event.agendas.page(params[:page]).per(API_PER_PAGE), each_serializer: AgendaSerializer
    else
      expose error! :not_found
    end
  end
end
