class CreateProductionItems < ActiveRecord::Migration
  def change
    create_table :production_items do |t|
    	t.string :name
    	t.integer :code
      t.timestamps null: false
    end
  end
end
