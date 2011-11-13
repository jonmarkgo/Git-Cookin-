class AddDescriptionToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :description, :string
  end

  def self.down
    remove_column :recipes, :description
  end
end
