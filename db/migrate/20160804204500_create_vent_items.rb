class CreateVentItems < ActiveRecord::Migration
  def change
    create_table :vent_items do |t|
      t.references :producto, index: true, foreign_key: true
      t.references :diseno, index: true, foreing_key:true
      t.references :vent, index: true, foreign_key: true
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
