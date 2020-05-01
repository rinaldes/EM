ActiveRecord::Base.connection.execute("TRUNCATE production_items RESTART IDENTITY");
puts "========== Seeding production_items.. =========="

ProductionItem.create!(:code => 'I001', :name => 'Coffee')
ProductionItem.create!(:code => 'I002', :name => 'Tea')
ProductionItem.create!(:code => 'I003', :name => 'Snack')
ProductionItem.create!(:code => 'I004', :name => 'Breakfast')
ProductionItem.create!(:code => 'I005', :name => 'Lunch')
ProductionItem.create!(:code => 'P006', :name => 'Dinner')

(1..20).each_with_index do |p, index|
  ProductionItem.create!(:code => "C00#{index+1}", :name => "Item #{index+1}")
end