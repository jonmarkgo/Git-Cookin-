class Step < ActiveRecord::Base
  belongs_to :recipe
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
end
