class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
    	t.integer :question_id
    	t.integer :event_id
    	t.integer :user_id
    	t.text :answer
      t.timestamps null: false
    end
  end
end
