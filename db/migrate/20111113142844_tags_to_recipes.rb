class TagsToRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes_tags, :id => false do |t|
        t.references :tag
        t.references :recipe
      end
  end

  def self.down
    drop_table :recipes_tags
  end
end