class StepIngredient < ActiveRecord::Base
    belongs_to :parent, :class_name => 'StepIngredient'
    belongs_to :step
    belongs_to :ingredient
    
    accepts_nested_attributes_for :step, :reject_if => lambda {|a| a[:instruction].blank? }, :allow_destroy => true
end
