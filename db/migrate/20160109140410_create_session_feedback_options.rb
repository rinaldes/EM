class CreateSessionFeedbackOptions < ActiveRecord::Migration
  def change
    create_table :session_feedback_options do |t|
    	t.integer :session_feedback_id
    	t.string :option
      t.timestamps null: false
    end
  end
end
