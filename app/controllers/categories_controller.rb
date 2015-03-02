class CategoriesController < ApplicationController

  before_action :search_category, only: :show

  def index
    @categories = Category.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @pictures = @category.pictures.order("created_at DESC")
  end

  private

  def search_category
    @category = Category.find(params[:id])
  end

end
