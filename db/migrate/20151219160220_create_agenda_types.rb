class CreateAgendaTypes < ActiveRecord::Migration
  def change
    create_table :agenda_types do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
