class Vent < ActiveRecord::Base
  has_many :vent_items
  belongs_to :empleado
  before_save :update_total

  def total
    vent_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end


  def total_with_shipping
    total + 5
  end

  def total_cents
    total_with_shipping * 100
  end

  private
  def update_total
    self[:total] = total
  end

end
