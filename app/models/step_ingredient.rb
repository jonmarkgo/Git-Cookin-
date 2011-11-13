class StepIngredient < ActiveRecord::Base
    belongs_to :parent, :class_name => 'StepIngredient'
    belongs_to :step
end
