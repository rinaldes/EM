class ProgrammesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:destroy]
  before_filter :prepare_event, only:[:destroy]

  def destroy
    @programme = Programme.find(params[:id])
    date = @programme.agenda.agenda_date
    @programme.destroy unless @programme.blank?
    redirect_to edit_event_agendas_path(@event.id, :agenda_date => date)
  end

  private

    def agenda_params
      params.require(:event).permit(agendas_attributes: [:id, :agenda_type_id, :event_id, :title, :place, :start_time, :end_time, :description, :agenda_date, :_destroy, programmes_attributes: [:id, :title, :start_time, :end_time, :description, :_destroy]])
    end

    def prepare_event
      @event = Event.find(params[:event_id])
    end
end
