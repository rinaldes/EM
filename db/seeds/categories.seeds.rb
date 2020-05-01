ActiveRecord::Base.connection.execute("TRUNCATE categories RESTART IDENTITY");
puts "========== Seeding categories.. =========="

Category.create!(:id => 1, :name => 'participant', :category_type => "attendee")
Category.create!(:id => 2, :name => 'speaker', :category_type => "attendee")
Category.create!(:id => 3, :name => 'admin', :category_type => "attendee")