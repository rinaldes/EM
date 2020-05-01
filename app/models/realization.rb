class Realization < ActiveRecord::Base
  belongs_to :production_type
  belongs_to :production_item
  belongs_to :event

  before_save :count_total_realization

  def self.in_type(in_type)
    if in_type.present?
      type = ProductionType.where(:code => in_type).first
      where("production_type_id = ?", type.id)
    else
      where(nil)
    end
  end

  def count_total_realization
    self.total = self.quantity * self.price
  end
end
