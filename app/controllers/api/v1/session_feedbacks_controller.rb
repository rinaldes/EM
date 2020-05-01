class Api::V1::SessionFeedbacksController < Api::V1::BaseController

  def index
    event = Event.find(params[:event_id])
    if event.present?
      expose event.session_feedbacks, :except => [:created_at, :updated_at], :include => [:session_feedback_options => {:except => [:created_at, :updated_at]}]
    else
      expose error! :not_found
    end
  end

  def create
    feedback = SessionFeedback.find(params[:session_feedback_id])

    feedback_answer = SessionFeedbackAnswer.find_or_initialize_by(session_feedback_id: feedback.id)
    if feedback_answer.update(
      :answer => params[:answer],
      :event_id => params[:event_id],
      :user_id => current_user.id
      )
    expose status: 200
  else
      expose error! :not_found
    end

  end

end

