class CreateSessionFeedbacks < ActiveRecord::Migration
  def change
    create_table :session_feedbacks do |t|
    	t.integer :event_id
    	t.text :question
    	t.string :answer_type
    	t.integer :answer_option_id
      t.timestamps null: false
    end
  end
end
