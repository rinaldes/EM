class AddEventIdOnMessages < ActiveRecord::Migration
  def change
    add_column :messages, :event_id, :integer
    add_index :messages, :event_id
  end
end
