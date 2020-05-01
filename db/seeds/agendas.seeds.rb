ActiveRecord::Base.connection.execute("TRUNCATE agendas RESTART IDENTITY");
puts "========== Seeding agendas.. =========="

events = Event.all
  events.each_with_index do |event, index|
    (event.start_date..event.end_date).each do |date|
      start_time = date.to_date+(Random.rand(00...10).hours)
      end_time = start_time.+(Random.rand(1...4).hours)
      agenda = AgendaType.all.sample
      agenda = event.agendas.create!(
        :agenda_type_id => agenda.id,
        :title => "#{agenda.name.try(:titleize)} #{index+1}",
        :place => "R20#{index+1}",
        :start_time => start_time,
        :end_time => end_time,
        :agenda_date => date.to_date,
        :description => Populator.words(30..90),
        :created_at => Time.now,
        :updated_at =>Time.now
      )
  end
end