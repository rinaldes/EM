module ApplicationHelper
  def format_time(date)
    date.strftime("%H:%M") unless date.blank?
  end

  def format_currency(number)
    number_to_currency(number, precision: 0, unit: "" ) unless number.blank?
  end

  def get_production_type_name(type)
    name = type.sub('-', ' ').try(:titleize) if type.present?
  end

  def current_programme(programme_id, agenda_id)
	programme = Programme.find(programme_id)
	return 'current open' if agenda_id == programme.agenda_id
  end

end