class AddTitleOnEventFiles < ActiveRecord::Migration
  def change
    add_column :event_files, :title, :string
  end
end
