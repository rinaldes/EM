class CreateEventFiles < ActiveRecord::Migration
  def change
    create_table :event_files do |t|
    	t.string :file
    	t.integer :user_id, :programme_id, :event_id
      t.timestamps null: false
    end

    add_index :event_files, :user_id
    add_index :event_files, :programme_id
    add_index :event_files, :event_id
  end
end
