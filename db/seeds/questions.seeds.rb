ActiveRecord::Base.connection.execute("TRUNCATE questions RESTART IDENTITY");
puts "========== Seeding questions.. =========="

programmes = Programme.all
  programmes.each do |programme|
    attendee_id = programme.agenda.event.attendees.first.id
    event_id = programme.agenda.event.id
    question = programme.questions.create!(
      :status => "pending",
      :attendee_id => attendee_id,
      :event_id => event_id,
      :vote_number => rand(0..100),
      :question => Populator.words(10..50),
      :created_at => Time.now,
      :updated_at =>Time.now
    )
end