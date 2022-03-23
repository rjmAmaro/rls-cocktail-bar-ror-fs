class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @cocktails = @category.cocktails
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path, notice: 'Category deleted successfully.'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
