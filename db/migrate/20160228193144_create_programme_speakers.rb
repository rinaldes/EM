class CreateProgrammeSpeakers < ActiveRecord::Migration
  def change
    create_table :programme_speakers do |t|
    	t.integer :programme_id
    	t.string :name
      t.timestamps null: false
    end
  end
end
