class Recipe < ActiveRecord::Base
  has_many :steps
  belongs_to :parent, :class_name => 'Recipe'
  belongs_to :user
end
