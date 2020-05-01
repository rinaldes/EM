class AddFieldsOnAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :name, :string
    add_column :attendees, :email, :string
    add_column :attendees, :avatar, :string
  end
end
