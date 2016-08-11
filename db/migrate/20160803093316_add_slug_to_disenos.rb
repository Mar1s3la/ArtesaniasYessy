class AddSlugToDisenos < ActiveRecord::Migration
  def change
    add_column :disenos, :slug, :string
    add_index :disenos, :slug, unique: true
  end
end
