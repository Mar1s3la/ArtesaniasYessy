class AddSlugToTamanos < ActiveRecord::Migration
  def change
    add_column :tamanos, :slug, :string
    add_index :tamanos, :slug, unique: true
  end
end
