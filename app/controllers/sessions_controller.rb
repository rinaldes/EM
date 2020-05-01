class SessionsController < ApplicationController
  before_filter :verify_authenticity_token

  def index
    @event = Event.find_by_id(params[:event_id])
    results = Event.get_attendees(params[:event_id], nil).order('events.CREATED_AT DESC')
    @attendees = results.page(params[:page]).per(PER_PAGE)
  end
end
