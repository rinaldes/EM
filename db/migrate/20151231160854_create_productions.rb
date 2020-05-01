class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
    	t.integer :production_type_id
    	t.integer :event_id
    	t.integer :production_item_id
    	t.integer :quantity
    	t.integer :days
    	t.float :price
    	t.string :notes
      t.timestamps null: false
    end
  end
end
