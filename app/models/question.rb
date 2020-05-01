class Question < ActiveRecord::Base
  belongs_to :programme
  belongs_to :event
  belongs_to :attendee
  belongs_to :user

  acts_as_votable

  def self.search(search)
    if search.present?
      where("users.name ILIKE ? OR question ILIKE ? OR questions.status ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where(nil)
    end
  end
end
