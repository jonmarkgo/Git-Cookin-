class Recipe < ActiveRecord::Base
  has_many :steps
  has_many :ingredients, :through => :steps
  has_many :forks, :foreign_key => 'parent_id'
  accepts_nested_attributes_for :steps, :reject_if => lambda {|a| a[:description].blank? }, :allow_destroy => true 
  has_many :children, :through => :forks
end
