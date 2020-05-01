class AgendasController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:destroy]
  before_filter :prepare_agenda, only: [:edit, :update]

  def edit; end

  def update
    if params[:new_agenda_type].present?
      new_agenda_type = AgendaType.find_or_initialize_by(:name => params[:new_agenda_type])
      new_agenda_type.update(:name => params[:new_agenda_type])
      params[:event][:agendas_attributes]["0"][:agenda_type_id] = new_agenda_type.id
    end

    date = params[:event][:agendas_attributes]["0"][:agenda_date]
    if @event.update_attributes(agenda_params)
      flash[:notice] = 'Agenda was successfully created.'
    else
      flash[:error] = @event.errors.full_messages
    end
    redirect_to edit_event_agendas_path(@event, :agenda_date => date)
  end

  def destroy
    @agenda = Agenda.find(params[:id])
    date = @agenda.agenda_date
    @agenda.destroy unless @agenda.blank?
    redirect_to edit_event_agendas_path(@agenda.event_id, :agenda_date => date)
    flash[:notice] = 'Agenda was successfully deleted.'
  end

  private

    def agenda_params
      params.require(:event).permit(agendas_attributes: [:id, :agenda_type_id, :event_id, :title, :place, :start_time, :end_time, :description, :agenda_date, :_destroy, programmes_attributes: [:id, :title, :start_time, :end_time, :description, :speaker, :_destroy]])
    end

    def prepare_agenda
      @event = Event.find(params[:event_id])
      if params[:agenda_date].present?
        @event_date = params[:agenda_date]
      else
        @event_date = @event.start_date
      end
    end
end