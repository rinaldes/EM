ActiveRecord::Base.connection.execute("TRUNCATE productions RESTART IDENTITY");
puts "========== Seeding productions.. =========="

events = Event.all
production_types = ProductionType.all

events.each_with_index do |event, index|
  production_types.each do |type|
    event.productions.create!(
      :production_type_id => type.id,
      :production_item_id => ProductionItem.all.sample.id,
      :quantity => [10, 25000, 50, 100, 250, 500, 10000].sample,
      :days => Random.rand(1...3),
      :price => [10000, 25000, 50000, 10000].sample,
      :notes => Populator.words(3..30),
      :created_at => Time.now,
      :updated_at => Time.now
    )
  end
end