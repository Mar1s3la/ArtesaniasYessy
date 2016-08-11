class AddAtributesToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :nombre, :string
    add_column :orders, :apellido, :string
    add_column :orders, :email, :string
  end
end
