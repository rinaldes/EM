class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, :status
      t.integer :attendee_id, :vote_number
      t.timestamps null: false
    end

    add_index :questions, :attendee_id
  end
end
