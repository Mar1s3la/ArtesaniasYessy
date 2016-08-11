class CreateJoinTableProductoDiseno < ActiveRecord::Migration
  def change
    create_join_table :productos, :disenos do |t|
      # t.index [:producto_id, :diseno_id]
      # t.index [:diseno_id, :producto_id]
    end
  end
end
