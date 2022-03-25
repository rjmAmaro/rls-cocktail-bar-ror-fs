# frozen_string_literal: true

class IngredientsController < ApplicationController
  before_action :set_ingredient, only: :show
  before_action :set_cocktail, only: :show

  def show; end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
