class Categories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nombre, null: false
      t.string :descripcion, null: false

      t.timestamps null: false
    end
    add_index :categories, :nombre, :unique => true
  end
end
