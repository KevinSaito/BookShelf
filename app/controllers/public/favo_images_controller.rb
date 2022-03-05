class Public::FavoImagesController < ApplicationController
  def new
    @favo_image = FavoImage.new
  end
  
  def create
    @favo_iamge = FavoImage.new(favo_iamge_params)
    @favo_iamge.user_id = current_user.id
    @favo_image.save
    redirect_to favo_iamges_path
  end

  def index
    @favo_images = FavoImage.all
  end

  def show
  end

  def edit
  end
  
  private
  
  def favo_iamge_params
    params.require(:favo_iamge).permit(:location, :caption, :image)
  end
end
