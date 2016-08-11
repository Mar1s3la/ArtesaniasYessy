class Disenos < ActiveRecord::Migration
  def change
    create_table :disenos do |t|
      t.string :diseno, null: false
      t.string :nombre, null: false

      t.timestamps null: false
    end
    add_index :disenos, :nombre, :unique => true
  end

end
