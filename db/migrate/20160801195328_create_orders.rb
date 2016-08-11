class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :shipping, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.references :order_status, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :nombre_res
      t.string :direccion
      t.string :ciudad
      t.string :estado
      t.string :pais
      t.string :cp

      t.timestamps null: false
    end
  end
end
