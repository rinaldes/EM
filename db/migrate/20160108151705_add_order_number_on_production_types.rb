class AddOrderNumberOnProductionTypes < ActiveRecord::Migration
  def change
    add_column :production_types, :order_number, :integer
  end
end
