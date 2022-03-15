class Public::FavoImagesController < ApplicationController
  def new
    @favo_image = FavoImage.new
  end

  def create
    @favo_image = FavoImage.new(favo_image_params)
    @favo_image.user_id = current_user.id
    if @favo_image.save
      redirect_to favo_images_path
    else
      render:new
    end
  end

  def index
    @favo_images = FavoImage.page(params[:page]).order(created_at: :desc)
  end

  def show
    @favo_image = FavoImage.find(params[:id])
    @favo_comment = FavoComment.new
  end

  def edit
    @favo_image = FavoImage.find(params[:id])
  end

  def update
    @favo_image = FavoImage.find(params[:id])
    @favo_image.update(favo_image_params)
    redirect_to favo_image_path(@favo_image.id)
  end

  def destroy
    @favo_image = FavoImage.find(params[:id])
    @favo_image.destroy
    redirect_to favo_images_path
  end

  private

  def favo_image_params
    params.require(:favo_image).permit(:location, :caption, :image, :user_id)
  end
end
