class Kitchen < ApplicationRecord

  has_many :preferences
  has_many :tasks
end
