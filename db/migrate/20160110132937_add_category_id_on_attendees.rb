class AddCategoryIdOnAttendees < ActiveRecord::Migration
  def change
  add_column :attendees, :category_id, :integer
  remove_column :attendees, :role_id
  end
end
