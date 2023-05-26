class Food < ApplicationRecord
  belongs_to :user
  has_many :food_recipes

  validates :measurement_unit, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
