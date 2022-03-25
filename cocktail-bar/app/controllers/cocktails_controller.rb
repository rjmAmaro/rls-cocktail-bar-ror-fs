class CocktailsController < ApplicationController
  before_action :set_category, only: %i[show destroy set_like set_rate set_like_show]
  before_action :set_cocktail, only: %i[show destroy set_like set_rate set_like_show]
  before_action :create_category, only: [:create]

  def search
    if params[:search]
      @search_result = Cocktail.all.filter do |cocktail|
        cocktail.name.downcase.include?(params[:search].to_s.downcase) || cocktail.ingredients.any? do |ingredient|
          ingredient.name.downcase.include?(params[:search].to_s.downcase)
        end
      end
      @search_result.sort! { |a, b| a.name <=> b.name }
    else
      @search_result = Cocktail.all
    end
  end

  def show
    @ingredients = @cocktail.ingredients
  end

  def new
    # @cocktail = @category.cocktails.build
  end

  def create
    @cocktail = @category.cocktails.build(name: params[:name], instructions: params[:instructions],
                                          picture: params[:picture], like: 0, rating: 0)

    @cocktail.save
    redirect_to category_cocktail_path(category_id: @category.id, id: @cocktail.id), notice: 'Cocktail added successfully.'

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

  def add_ingredient_form
    @category = Category.find(params[:category_id])
    @cocktail = @category.cocktails.find(params[:cocktail_id])
  end

  def add_ingredient
    @cocktail = Cocktail.find(params[:id])
    new_ingredient = Ingredient.find(params[:ingredient])
    if @cocktail.ingredients.any? { |ingredient| ingredient == new_ingredient }
      redirect_to :back, notice: 'Ingredient already present in this cocktail.'

    else
      @cocktail.ingredients << new_ingredient
      @cocktail.save
      redirect_to :back, notice: 'Ingredient added to cocktail successfully.'
    end
  end

  def set_like
    @cocktail.like = if @cocktail.like == 1
                       0
                     else
                       1
                     end
    @cocktail.save
    render @category.cocktails
  end

  def set_like_show
    @cocktail.like = if @cocktail.like == 1
                       0
                     else
                       1
                     end
    @cocktail.save
    redirect_to categories_path
  end

  def check_like
    @cocktail.like
  end

  helper_method :check_like

  def set_rate; end

  private

  def create_category
    unless params[:picture].include?('https://')
      redirect_to :back, notice: "Picture urls must start with 'https://'"
    end
    if params[:new_category]
      if Category.all.any? { |category| category.name == params[:category_name] }
        redirect_to :back, notice: 'There already exists a category with that name.'
      elsif Cocktail.all.any? { |cocktail| cocktail.name == params[:name] }
        redirect_to :back, notice: 'There already exists a cocktail with that name.'
      elsif !helpers.image_valid?(params[:picture])
        redirect_to :back, notice: 'The provided image url is not valid.'
      else
        @category = Category.create(name: params[:category_name])
        @category.save
      end
    else
      @category = Category.find(params[:new_cocktail_category])
    end
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture, :instructions, :search_by_name)
  end

  def set_cocktail
    @cocktail = @category.cocktails.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
