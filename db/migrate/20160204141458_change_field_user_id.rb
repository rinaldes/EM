class ChangeFieldUserId < ActiveRecord::Migration
  def change
    remove_index :messages, :user_id
    rename_column :messages, :user_id, :phone
    change_column :messages, :phone, :string
  end
end
