class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.integer :parent_id
      t.integer :recipe_id
      t.string :instruction
      t.integer :sortnum

      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
