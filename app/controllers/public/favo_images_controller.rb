class Public::FavoImagesController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :favorites]
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
    @favo_images = FavoImage.page(params[:page]).order(created_at: :desc).per(5)
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
    if @favo_image.update(favo_image_params)
      redirect_to favo_image_path(@favo_image.id)
    else
      render:edit
    end
  end

  def destroy
    @favo_image = FavoImage.find(params[:id])
    @favo_image.destroy
    redirect_to favo_images_path
  end
  # 写真検索用
  def search
    if params[:keyword].present?
      @favo_images = FavoImage.page(params[:page]).search(params[:keyword]).reverse_order
      @keyword = params[:keyword]
    else
      @favo_images = FavoImage.page(params[:page]).reverse_order
    end
  end

  private

  def favo_image_params
    params.require(:favo_image).permit(:location, :caption, :image, :user_id)
  end
  # 編集ページ等他者が覗けないように
  def ensure_correct_user
    @favo_image = FavoImage.find(params[:id])
    unless @favo_image.user == current_user
      redirect_to favo_images_path
    end
  end
end
