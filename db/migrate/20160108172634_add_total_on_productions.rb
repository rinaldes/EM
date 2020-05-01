class AddTotalOnProductions < ActiveRecord::Migration
  def change
    add_column :productions, :total, :float
  end
end
