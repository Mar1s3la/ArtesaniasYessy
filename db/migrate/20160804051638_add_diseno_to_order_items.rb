class AddDisenoToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :diseno, index: true, foreign_key: true
  end
end
