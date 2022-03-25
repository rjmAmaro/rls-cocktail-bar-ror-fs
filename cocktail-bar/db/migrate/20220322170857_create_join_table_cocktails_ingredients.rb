# frozen_string_literal: true

class CreateJoinTableCocktailsIngredients < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cocktails, :ingredients do |t|
      # t.index [:cocktail_id, :ingredient_id]
      # t.index [:ingredient_id, :cocktail_id]
    end
  end
end
