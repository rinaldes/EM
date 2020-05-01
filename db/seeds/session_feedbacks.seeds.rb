ActiveRecord::Base.connection.execute("TRUNCATE session_feedbacks RESTART IDENTITY");
ActiveRecord::Base.connection.execute("TRUNCATE session_feedback_options RESTART IDENTITY");
puts "========== Seeding session_feedbacks.. =========="

events = Event.all
events.each_with_index do |event, index|
  event.agendas.each do |agenda|

    agenda.programmes.each do |prog|
      type = ANSWER_TYPE.sample

      question = prog.session_feedbacks.create!(
        :event_id => event.id,
        :question => Populator.words(5..20),
        :answer_type => type,
        :programme_id => prog.id,
        :created_at => Time.now,
        :updated_at => Time.now
      )
      if type == "Multiple Answer" || (type == "Selection")
        (1..5).each do
          question.session_feedback_options.create!(
            :option => Populator.words(2..10)
          )
        end
      end
    end
  end
end