class CategoriesController < ApplicationController

  before_action :search_category, only: :show

  def index
    @categories = Category.all.order("created_at DESC")
  end

  def show
    @pictures = @category.pictures
  end

  private

  def search_category
    @category = Category.find(params[:id])
  end

end
