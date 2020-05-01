class AddSpeakerOnProgramme < ActiveRecord::Migration
  def change
    add_column :programmes, :speaker, :string
  end
end
