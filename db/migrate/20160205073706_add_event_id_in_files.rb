class AddEventIdInFiles < ActiveRecord::Migration
  def change
    add_column :event_files, :event_id, :integer
    add_index :event_files, :event_id
  end
end
