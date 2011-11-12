class Fork < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Recipe'
  belongs_to :child, :class_name => 'Recipe'
end
