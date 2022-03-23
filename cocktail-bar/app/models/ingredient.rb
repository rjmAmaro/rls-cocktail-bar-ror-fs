class Ingredient < ApplicationRecord
  has_and_belongs_to_many :cocktails

  validates :name, presence: true
  validates :description, presence: true
  validates :picture, presence: true
end
