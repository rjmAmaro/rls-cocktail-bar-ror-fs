class CocktailsController < ApplicationController
  before_action :set_category, only: [:show, :set_like, :check_like, :set_like_show, :set_rate_one, :set_rate_two, :set_rate_three, :set_rate_four, :set_rate_five]
  before_action :set_cocktail, only: [:show, :set_like, :check_like, :set_like_show, :set_rate_one, :set_rate_two, :set_rate_three, :set_rate_four, :set_rate_five]
  @img_path="heart_empty.svg"

  def index
    @cocktails = Cocktail.search_by_name(params[:search_by_name])
  end

  def search
      if params[:search]
        @search_result = Cocktail.all.filter do |cocktail|
          cocktail.name.downcase.include?(params[:search].to_s.downcase) || cocktail.ingredients.any? do |ingredient|
            ingredient.name.downcase.include?(params[:search].to_s.downcase)
          end
        end
        @search_result.sort! { |a,b| a.name <=> b.name }
      else
        @search_result = Cocktail.all
      end
  end

  def show
    @ingredients = @cocktail.ingredients
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

  def set_like
    if @cocktail.like == 1
      @cocktail.like = 0
    else
      @cocktail.like = 1
    end
    @cocktail.save
    render @category.cocktails
  end

  def set_like_show
    if @cocktail.like == 1
      @cocktail.like = 0
    else
      @cocktail.like = 1
    end
    @cocktail.save
    redirect_to categories_path
  end

  def check_like
    @cocktail.like
  end

  helper_method :check_like


  def set_rate_one
    @cocktail.rating = 1
    @cocktail.save
    render @category.cocktails
  end

  def set_rate_two
    @cocktail.rating = 2
    @cocktail.save
    render @category.cocktails
  end

  def set_rate_three
    @cocktail.rating = 3
    @cocktail.save
    render @category.cocktails
  end

  def set_rate_four
    @cocktail.rating = 4
    @cocktail.save
    render @category.cocktails
  end

  def set_rate_five
    @cocktail.rating = 5
    @cocktail.save
    render @category.cocktails
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture, :description, :search_by_name)
  end

  def set_cocktail
    @cocktail = @category.cocktails.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
