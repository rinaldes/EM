class CreateEventSizes < ActiveRecord::Migration
  def change
    create_table :event_sizes do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
