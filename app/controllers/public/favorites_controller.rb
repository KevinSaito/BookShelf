class Public::FavoritesController < ApplicationController
  def create
    favo_image = FavoImage.find(params[:favo_image_id])
    favorite = Favorite.new(favo_image_id: favo_image.id)
    favorite.user_id = current_user.id
    favorite.save
    redirect_to favo_image_path(favo_image.id)
  end

  def destroy
    favo_image = FavoImage.find(params[:favo_image_id])
    favorite = Favorite.find_by(favo_image_id: favo_image.id)
    favorite.user_id = current_user.id
    favorite.destroy
    redirect_to favo_image_path(favo_image.id)
  end
end
