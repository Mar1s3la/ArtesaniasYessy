class CreateJoinTableProductoCategory < ActiveRecord::Migration
  def change
    create_join_table :productos, :categories do |t|
      # t.index [:producto_id, :category_id]
      # t.index [:category_id, :producto_id]
    end
  end
end
