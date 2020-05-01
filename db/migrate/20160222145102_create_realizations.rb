class CreateRealizations < ActiveRecord::Migration
  def change
    create_table :realizations do |t|
    	t.integer :production_type_id
    	t.integer :event_id
    	t.integer :production_item_id
    	t.integer :quantity
    	t.integer :days
    	t.float :price
    	t.string :notes
    	t.float :total
      t.timestamps null: false
    end
  end
end
