class PicturesController < ApplicationController

  before_action :search_picture, only: :show

  def show
  end

  private

  def search_picture
    @picture = Picture.find(params[:id])
  end

end
