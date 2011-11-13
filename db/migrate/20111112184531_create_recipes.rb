class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :name
      t.integer :timetocook
      t.integer :servings
      t.integer :votes_up
      t.integer :votes_down

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
