class QuestionsController < ApplicationController
  before_filter :verify_authenticity_token
  before_filter :prepare_parent
  before_filter :get_questions_list, only: :index

  def index;end

  def change_status
    @question = Question.find(params[:id])
    @question.update_attributes(:status => "answered")
    get_questions_list
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def programmes
    @programmes = Agenda.find_by_id(params[:agenda_id]).programmes
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  private
    def prepare_parent
      @event = Event.find_by_id(params[:event_id])
    end

    def get_questions_list
      @agendas = @event.agendas
      if current_user.is_admin?
        results = @event.questions.search(params[:search])
      else
        results = @event.questions.joins(:attendee).joins("INNER JOIN users ON attendees.user_id = users.id").search(params[:search])
      end

      if params[:programme_id].present?
        results = results.where("questions.programme_id = ?", params[:programme_id])
      end

      if results.present?
        results = results.order('created_at DESC')
        @questions = results.page(params[:page]).per(PER_PAGE)
      end
    end
end
