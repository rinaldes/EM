class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name
    	t.date :start_date
    	t.date :end_date
    	t.float :event_size
    	t.string :venue_name
    	t.string :address
    	t.float :latitude
    	t.float :longitude
    	t.text :description
    	t.string :status
      t.timestamps null: false
    end
  end
end
