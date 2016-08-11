class OrderItem < ActiveRecord::Base
  belongs_to :diseno
  belongs_to :producto
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  validates :order_id, :uniqueness => { :scope => [:producto_id, :diseno_id], :message => "Producto ya esta en el carrito." }

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
  def product_present
    if producto.nil?
      errors.add(:producto, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
