class Productos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :fotografia
      t.string :producto, index: true, null: false
      t.string :descripcion, null: false
      t.references :tamano, index: true, foreign_key: true
      t.integer :largo, null: false
      t.integer :alto, null: false
      t.integer :ancho, null: false
      t.decimal :precio,  precision: 8, scale: 2, null: false
      t.timestamps null: false
    end
  end
end
