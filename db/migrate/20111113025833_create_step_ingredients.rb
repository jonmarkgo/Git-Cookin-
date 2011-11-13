class CreateStepIngredients < ActiveRecord::Migration
  def self.up
    create_table :step_ingredients do |t|
      t.integer :parent_id
      t.float :quanity
      t.string :measurement
      t.integer :ingredient_id
      t.integer :step_id

      t.timestamps
    end
  end

  def self.down
    drop_table :step_ingredients
  end
end
