class AddPreperationtimeToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :preperationtime, :integer
  end

  def self.down
    remove_column :recipes, :preperationtime
  end
end
