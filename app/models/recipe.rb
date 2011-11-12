class Recipe < ActiveRecord::Base
  has_many :steps
  has_many :ingredients, :through => :steps
  has_many :forks, :foreign_key => 'parent_id'
  has_many :children, :through => :forks
end
