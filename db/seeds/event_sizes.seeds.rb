ActiveRecord::Base.connection.execute("TRUNCATE event_sizes RESTART IDENTITY");
puts "========== Seeding event sizes.. =========="

EventSize.create!(:id => 1, :name => 'Less than 50 People')
EventSize.create!(:id => 2, :name => '50 to 100 People')
EventSize.create!(:id => 3, :name => '100 to 500 People')
EventSize.create!(:id => 4, :name => '500 to 1.000 People')
EventSize.create!(:id => 5, :name => '1.000 to 5.000 People')
EventSize.create!(:id => 6, :name => '5.000 to 10.000 People')
EventSize.create!(:id => 7, :name => 'More than 10.000 People')