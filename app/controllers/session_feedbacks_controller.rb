class SessionFeedbacksController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:destroy]
  before_filter :prepare_event
  before_filter :session_feedbacks
  before_filter :session_feedback, only: [:edit, :update, :destroy]

  def edit
    @sessions = Programme.joins(:agenda).where("agendas.event_id = ?", @event.id)
  end

  def new
    @session_feedback = SessionFeedback.new
    @sessions = Programme.joins(:agenda).where("agendas.event_id = ?", @event.id)
  end

  def create
    @session_feedback = @event.session_feedbacks.new(session_feedback_params)
      if @session_feedback.save
        # page = params[:commit] == 'Save & Next' ? edit_event_session_feedback_path(@session_feedback.event_id, @session_feedback.id) : edit_event_session_feedback_path(@session_feedback.event_id, @session_feedback.id)
        flash[:notice] = 'Session Feedback was successfully created.'
        redirect_to edit_event_session_feedback_path(@session_feedback.event_id, @session_feedback.id)
      else
        flash[:error] = @session_feedback.errors.full_messages
        render :new
      end
  end

  def update
    if @session_feedback.update_attributes(session_feedback_params)
      flash[:notice] = 'Session Feedback was successfully updated.'
      redirect_to edit_event_session_feedback_path(@session_feedback.event_id, @session_feedback.id)
    else
      flash[:error] = @session_feedback.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @session_feedback.destroy
      flash[:notice] = 'Session Feedback was successfully deleted.'
      redirect_to new_event_session_feedback_path(@session_feedback.event_id)
    else
      flash[:error] = @session_feedback.errors.full_messages
      render :edit
    end
  end

 private
    def session_feedback_params
      params.require(:session_feedback).permit(:question, :answer_type, :event_id, :_destroy, :programme_id, session_feedback_options_attributes:[:id, :session_feedback_id, :option])
    end

    def prepare_event
      @event = Event.find(params[:event_id])
    end

    def session_feedbacks
      @session_feedbacks = @event.session_feedbacks.order('created_at asc')
    end

   def session_feedback
      @session_feedback = @event.session_feedbacks.where(:id => params[:id]).first
    end
end