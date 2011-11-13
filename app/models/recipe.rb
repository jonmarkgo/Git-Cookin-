class Recipe < ActiveRecord::Base
  has_many :steps
  belongs_to :parent, :class_name => 'Recipe'
  belongs_to :user
  
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :steps, :reject_if => lambda {|a| a[:instruction].blank? }, :allow_destroy => true 
end
