class Tamanos < ActiveRecord::Migration
  def change
    create_table :tamanos do |t|
      t.belongs_to :productos, index: true
      t.string :tamano, null: false
      t.string :descripcion, null: false

      t.timestamps null: false
    end
    add_index :tamanos, :tamano, :unique => true
  end
end
