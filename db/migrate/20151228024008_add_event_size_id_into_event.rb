class AddEventSizeIdIntoEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_size_id, :integer
  end
end
