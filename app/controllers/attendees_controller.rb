class AttendeesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:destroy]
  before_filter :prepare_event, only: [:edit, :update, :destroy]

  def edit; end

  def update
    if params[:new_category].present?
      new_category = Category.find_or_initialize_by(:name => params[:new_category])
      new_category.update(name: params[:new_category], category_type: 'attendee')
      params[:event][:attendees_attributes]["0"][:category_id] = new_category.id
    end

    if @event.update_attributes(attendee_params)
      flash[:notice] = 'Attendee was successfully updated.'
    else
      flash[:error] = @event.errors.full_messages
    end
    redirect_to edit_event_attendees_path(:event_id => @event.id)
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    if @attendee.destroy
      flash[:notice] = 'Attendee was successfully deleted.'
      redirect_to edit_event_attendees_path(:event_id => @event.id)
    else
      flash[:error] = @attendee.errors.full_messages
      render :edit
    end
  end

  private
    def attendee_params
      params.require(:event).permit(attendees_attributes: [:id, :name, :email, :phone, :avatar, :event_id, :category_id, :_destroy])
    end

    def prepare_event
      @event = Event.find(params[:event_id])
    end

end