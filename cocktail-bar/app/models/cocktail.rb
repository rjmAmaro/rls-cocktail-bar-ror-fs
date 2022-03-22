class Cocktail < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :ingredients, through: Ingredient

  validates :name, presence: true
  validates :picture, presence: true
  validates :instructions, presence: true
end
