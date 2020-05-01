class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message, :status
      t.integer :user_id
      t.timestamps null: false
    end

    add_index :messages, :user_id
  end
end
