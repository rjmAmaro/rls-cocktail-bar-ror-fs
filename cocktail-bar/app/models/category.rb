# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :cocktails, dependent: :destroy

  validates :name, presence: true
end
