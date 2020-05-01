ActiveRecord::Base.connection.execute("TRUNCATE production_types RESTART IDENTITY");
puts "========== Seeding production_types.. =========="

ProductionType.create!(:code => 'main-power', :name => 'Main Power', :order_number => 1)
ProductionType.create!(:code => 'accomodation', :name => 'Accomodation', :order_number => 2)
ProductionType.create!(:code => 'transportation', :name => 'Transportation', :order_number => 3)
ProductionType.create!(:code => 'material', :name => 'Material', :order_number => 4)
ProductionType.create!(:code => 'f&b', :name => 'F&B', :order_number => 5)