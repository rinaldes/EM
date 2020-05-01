class AddTokenIntoAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :invitation_token, :string
  end
end
