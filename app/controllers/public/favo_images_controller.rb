class Public::FavoImagesController < ApplicationController
  def new
    @favo_image = FavoImage.new
  end

  def create
    @favo_image = FavoImage.new(favo_image_params)
    @favo_image.user_id = current_user.id
    @favo_image.save
    redirect_to favo_images_path
  end

  def index
    @favo_images = FavoImage.all
  end

  def show
    @favo_image = FavoImage.find(params[:id])
    @favo_comment = FavoComment.new
  end

  def edit
  end

  def destroy
    @favo_image = FavoImage.find(params[:id])
    @favo_image.destroy
    redirect_to favo_images_path
  end

  private

  def favo_image_params
    params.require(:favo_image).permit(:location, :caption, :image)
  end
end
