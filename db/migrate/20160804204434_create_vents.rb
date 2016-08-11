class CreateVents < ActiveRecord::Migration
  def change
    create_table :vents do |t|
      t.references :empleado, index: true, foreign_key: true
      t.decimal :total, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
