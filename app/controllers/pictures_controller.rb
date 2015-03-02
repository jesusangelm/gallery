class PicturesController < ApplicationController

  before_action :search_picture, only: :show

  def show
    @current_category = Picture.current_category(params[:category_id])
  end

  private

  def search_picture
    @picture = Picture.find(params[:id])
  end

end
