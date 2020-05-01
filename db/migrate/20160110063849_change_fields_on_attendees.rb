class ChangeFieldsOnAttendees < ActiveRecord::Migration
  def change
	add_column :attendees, :role_id, :integer
	remove_column :users, :role_id
	add_column :users, :is_admin, :boolean, :default => false
  end
end
