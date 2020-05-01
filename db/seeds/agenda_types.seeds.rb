ActiveRecord::Base.connection.execute("TRUNCATE agenda_types RESTART IDENTITY");
puts "========== Seeding agenda_type.. =========="

AgendaType.create(:name => "session")
AgendaType.create(:name => "registration")
AgendaType.create(:name => "panel")
AgendaType.create(:name => "breakfast")
AgendaType.create(:name => "keynotes")
AgendaType.create(:name => "lunch")
AgendaType.create(:name => "coffee break")
AgendaType.create(:name => "dinner")
AgendaType.create(:name => "break")
AgendaType.create(:name => "tutorial")
AgendaType.create(:name => "workshop")
AgendaType.create(:name => "others")