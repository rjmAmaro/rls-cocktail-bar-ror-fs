# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy]

  def index
    @hide = true
    @categories = Category.all
  end

  def show
    @cocktails = @category.cocktails
  end

  def new
    # @category = Category.new
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

    render categories_path, notice: 'Category deleted successfully.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
