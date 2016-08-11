class VentItem < ActiveRecord::Base
  belongs_to :empleado
  belongs_to :diseno
  belongs_to :producto
  belongs_to :vent

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :vent_present

  before_save :finalize

  validates :vent_id, :uniqueness => { :scope =>[:producto_id, :diseno_id], :message => "Producto ya esta en el carrito." }

  def unit_price
    if persisted?
      self[:unit_price]
    else
      producto.precio
    end
  end

  def total_price
    unit_price * quantity
  end

  private
  def vent_present
    if vent.nil?
      errors.add(:vent, "is not a valid order.")
    end
  end


  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
