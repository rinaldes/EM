class AddProgrammeIdOnSessionFeedbacks < ActiveRecord::Migration
  def change
    add_column :session_feedbacks, :programme_id, :integer
  end
end
