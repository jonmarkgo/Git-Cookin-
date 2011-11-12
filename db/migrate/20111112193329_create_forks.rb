class CreateForks < ActiveRecord::Migration
  def self.up
    create_table :forks do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end

  def self.down
    drop_table :forks
  end
end
