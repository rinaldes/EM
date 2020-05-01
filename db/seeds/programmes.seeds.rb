ActiveRecord::Base.connection.execute("TRUNCATE programmes RESTART IDENTITY");
puts "========== Seeding programmes.. =========="

agendas = Agenda.all
agendas.each_with_index do |agenda, index|
  (agenda.start_time.to_datetime..agenda.end_time.to_datetime).each do |time|
    start_time = time+(Random.rand(0...2).hours)
    end_time = start_time+(Random.rand(1...2).hours)
    agenda.programmes.create!(
      :title => "Programme #{index+1}",
      :start_time => start_time,
      :end_time => end_time,
      :programme_date => agenda.agenda_date,
      :description => Populator.words(30..90),
      :created_at => Time.now,
      :updated_at =>Time.now
    )
  end
end