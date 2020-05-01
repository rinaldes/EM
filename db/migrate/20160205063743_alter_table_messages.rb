class AlterTableMessages < ActiveRecord::Migration
  def change
  	rename_column :messages, :phone, :user_ids
    add_column :users, :registration_id, :integer
    add_index :users, :registration_id
  end
end
