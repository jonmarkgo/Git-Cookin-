class Step < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Step'
  belongs_to :recipe
  has_many :step_ingredients
  
  accepts_nested_attributes_for :step_ingredients, :allow_destroy => true
end
