class Api::V1::ProductionsController < Api::V1::BaseController
  def index
    event = Event.find(params[:event_id])
    if event.present?
      expose event.productions.page(params[:page]).per(API_PER_PAGE), :except => [:created_at, :event_id], :include => [ {:production_type => {:except => [:created_at, :updated_at]}}, :production_item => {:except => [:created_at, :updated_at] }]
    else
      expose error! :not_found
    end
  end
end
