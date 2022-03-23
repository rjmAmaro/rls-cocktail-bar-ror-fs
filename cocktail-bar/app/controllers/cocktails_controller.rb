class CocktailsController < ApplicationController
  before_action :set_category, only: :show
  before_action :set_cocktail, only: :show

  def show

  end

  def new
    @cocktail = @category.cocktails.build
  end

  def create
    @cocktail = @category.cocktails.build(cocktail_params)

    if @cocktail.save
      redirect_to categories_path, notice: "Cocktail added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to categories_path, notice: 'Cocktails updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cocktail.destroy

    redirect_to categories_path, notice: 'Cocktail deleted successfully.'
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture, :description)
  end

  def set_cocktail
    @cocktail = @category.cocktails.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end
