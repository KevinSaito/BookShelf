class Public::FavoritesController < ApplicationController
  def create
    favo_image = FavoImage.find(params[:favo_image_id])
    favorite = current_user.favorites.new(favo_image_id: favo_image.id)
    favorite.save
    redirect_to favo_image_path(favo_image.id)
  end

  def destroy
    favo_image = FavoImage.find(params[:favo_image_id])
    favorite = current_user.favorites.find_by(favo_image_id: favo_image.id)
    favorite.destroy
    redirect_to favo_image_path(favo_image.id)
  end
end
