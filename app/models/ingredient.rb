class Ingredient < ActiveRecord::Base
  has_many :stepingredients
end
