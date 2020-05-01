class AlterTableQuestionsEventFilesAndMessages < ActiveRecord::Migration
  def up
    add_column :questions, :programme_id, :integer
    add_column :messages, :programme_id, :integer
    remove_column :event_files, :event_id
    add_index :questions, :programme_id
    add_index :messages, :programme_id
  end

  def down
    remove_column :questions, :programme_id
    remove_column :messages, :programme_id
    add_column :event_files, :event_id, :integer
    remove_index :questions, :programme_id
    remove_index :messages, :programme_id
  end
end
