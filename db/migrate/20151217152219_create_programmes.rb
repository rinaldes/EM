class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
    	t.integer :agenda_id
    	t.string :title
    	t.time :start_time
    	t.time :end_time
      t.date :programme_date
    	t.text :description
    	t.string :status
      t.timestamps null: false
    end
  end
end
