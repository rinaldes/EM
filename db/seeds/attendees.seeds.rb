ActiveRecord::Base.connection.execute("TRUNCATE attendees RESTART IDENTITY");
puts "========== Seeding attendees.. =========="

events = Event.all
events.each_with_index do |event, index|
  user = User.where(:is_admin => false).sample
  category = Category.where(:category_type => 'attendee').sample
  event.attendees.create!(
    :user_id => user.id,
    :category_id => category.id
  )
end