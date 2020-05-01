class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
    	t.integer :event_id
    	t.integer :agenda_type_id
    	t.string :title
    	t.string :place
    	t.time :start_time
    	t.time :end_time
      t.date :agenda_date
    	t.text :description
    	t.string :status
      t.timestamps null: false
    end
  end
end
