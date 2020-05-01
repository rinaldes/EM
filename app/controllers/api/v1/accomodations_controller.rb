class Api::V1::AccomodationsController < Api::V1::BaseController

  def index
    accomodation = ProductionType.where(:code => 'accomodation').first
    accomodations = Production.where(:production_type_id => accomodation.id, :event_id => params[:event_id])
    if accomodations.present?
      # expose event.agendas.page(params[:page]).per(API_PER_PAGE), :except => [:created_at, :updated_at, :status], :include => { :programmes => { :only => [:id, :agenda_id, :title, :start_time, :end_time, :description] } }
      expose accomodations, each_serializer: AccomodationSerializer #.productions.where(:production) .page(params[:page]).per(API_PER_PAGE), each_serializer: AgendaSerializer
    else
      expose error! :not_found
    end
  end

end
