class Api::V1::QuestionsController < Api::V1::BaseController

  def index
    questions = Question.where(:programme_id => params[:programme_id])
    if questions.present?
      expose questions.page(params[:page]).per(API_PER_PAGE), each_serializer: QuestionSerializer
    else
      expose error! :not_found
    end
  end

  def create
    session = Programme.find(params[:programme_id])
    question = session.questions.new(
      :question => params[:question],
      :user_id => current_user.id,
      :event_id => session.agenda.event.id,
      :attendee_id => session.agenda.event.attendees.where(user_id: current_user.id).first.id
      )
    if question.save
      expose ({status: 200, question_id: question.id})
    else
      expose error! :not_found
    end
  end

  def update
  end

  def destroy
  end

  def votes
    question = Question.find(params[:id])
    if question.liked_by current_user
      expose ({status: 200, question_id: question.id, total_votes: question.votes_for.size})
    else
      expose error! :not_found
    end
  end

end

