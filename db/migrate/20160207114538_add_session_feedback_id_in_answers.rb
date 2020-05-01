class AddSessionFeedbackIdInAnswers < ActiveRecord::Migration
  def change
    add_column :session_feedback_answers, :session_feedback_id, :integer
  end
end
