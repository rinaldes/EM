namespace :load do

  namespace :sample do
    desc "Load all sample data into database"
    task :data => :environment do
      Rake::Task["db:seed:categories"].invoke
      Rake::Task["db:seed:event_sizes"].invoke
      Rake::Task["db:seed:production_items"].invoke
      Rake::Task["db:seed:production_types"].invoke
      Rake::Task["db:seed:agenda_types"].invoke
      Rake::Task["db:seed:users"].invoke
      Rake::Task["db:seed:events"].invoke
      Rake::Task["db:seed:agendas"].invoke
      Rake::Task["db:seed:programmes"].invoke
      Rake::Task["db:seed:attendees"].invoke
      Rake::Task["db:seed:productions"].invoke
      Rake::Task["db:seed:session_feedbacks"].invoke
    end
  end

end