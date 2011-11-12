class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :steps
  has_many :forks, :foreign_key => 'parent_id'
  has_many :children, :through => :forks
end
