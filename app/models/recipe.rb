class Recipe < ApplicationRecord
  validates :title, :food_type, :ingredients, :directions, presence: true
end
