class Step < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Step'
  belongs_to :recipe
  has_many :stepingredients, :class_name => 'StepIngredient'
end
