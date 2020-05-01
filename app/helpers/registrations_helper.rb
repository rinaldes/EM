module RegistrationsHelper
  def get_registration_sessions(event_id)
    event = Event.find_by_id(event_id)
    agenda_ids = event.agendas.pluck(:id)
    sessions_title = Programme.where("agenda_id IN (?)", agenda_ids).pluck(:title).join(", ")

    return sessions_title
  end
end
