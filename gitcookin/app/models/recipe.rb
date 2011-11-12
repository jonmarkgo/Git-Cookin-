class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :steps
  has_many :forks
end
