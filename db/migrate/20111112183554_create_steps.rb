class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.string :description
      t.integer :recipe_id
      t.integer :seq

      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
