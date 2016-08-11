class AddActiveToEmpleados < ActiveRecord::Migration
  def change
    add_column :empleados, :active, :boolean
  end
end
