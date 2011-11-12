class Step < ActiveRecord::Base
  belongs_to :recipe
  has_many :ingredients
end
