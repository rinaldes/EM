class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:destroy]
  before_filter :prepare_event, only: [:edit, :update, :destroy]

  def index
    if current_user.is_admin?
      results = Event.search(params[:search]).order('CREATED_AT DESC')
    else
      results = Event.joins(:attendees).where("attendees.user_id =?", current_user.id).search(params[:search]).order('CREATED_AT DESC')
    end
    @events = results.page(params[:page]).per(PER_PAGE)
  end

  def new
    @event = Event.new
  end

  def create
    params[:event][:start_date] = params[:event][:start_date].to_date if params[:event][:start_date].present?
    params[:event][:end_date] = params[:event][:end_date].to_date if params[:event][:end_date].present?
    @event = Event.new(event_params)
    if @event.save
      next_step = params[:save] == 'Save' ? edit_event_path(@event) : edit_event_agendas_path(@event)
      flash[:notice] = 'Event was successfully created.'
      redirect_to next_step
    else
      flash[:error] = "Event cannot be created! Please check your input."
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:notice] = 'Event was successfully updated.'
      redirect_to edit_event_agendas_path(@event)
    else
      flash[:error] = @event.errors.full_messages
      render :edit
    end
  end

  def destroy
    @event.destroy if @event.present? #&& @event.is_created?
    flash[:notice] = 'Event was successfully deleted.'
    redirect_to events_path
  end

  def show
  end

  def submit
    @event = Event.find(params[:event_id])
    @event.update_attributes(status: "submitted")
    attendees = @event.attendees
    @event.attendees.each do |attendee|
      user = User.where(email: attendee.email).first
      if attendee.user_id.blank?
        if user.blank?
          user = User.new
          user.name = attendee.name
          user.email = attendee.email
          user.phone = attendee.phone
          user.password, user.password_confirmation = "#{attendee.name.split.join.downcase}123456789"
          user.skip_confirmation_notification!
          user.save!
        end
        attendee.update_attributes(user_id: user.id)
      end
    end
    flash[:notice] = 'Event was submited!.'
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :cover,:start_date, :end_date, :event_size_id, :venue_name, :latitude, :longitude, :address, :description)
    end

    def prepare_event
      @event = Event.find(params[:id])
    end
end