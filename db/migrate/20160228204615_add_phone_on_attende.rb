class AddPhoneOnAttende < ActiveRecord::Migration
  def change
    add_column :attendees, :phone, :string
  end
end
