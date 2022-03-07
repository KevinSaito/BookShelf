class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favo_images = @user.favo_images
    favorites = Favorite.where(user_id: current_user.id).pluck(:favo_image_id)
    @favorite_list = FavoImage.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
