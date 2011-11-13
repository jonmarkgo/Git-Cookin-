class AddImageToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :image, :string
  end

  def self.down
    remove_column :recipes, :image
  end
end
