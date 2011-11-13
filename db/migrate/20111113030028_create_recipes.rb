class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.integer :parent_id
      t.integer :votes_up
      t.integer :votes_down
      t.integer :servings

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
