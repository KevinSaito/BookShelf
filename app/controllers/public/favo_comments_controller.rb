class Public::FavoCommentsController < ApplicationController
  def create
    favo_image = FavoImage.find(params[:favo_image_id])
    comment = FavoComment.new(favo_comment_params)
    comment.user_id = current_user.id
    comment.favo_image_id = favo_image.id
    comment.save
    redirect_to favo_image_path(favo_image.id)
  end

  def destroy
    FavoComment.find(params[:id]).destroy
    redirect_to favo_image_path(params[:favo_image_id])
  end

  private
  def favo_comment_params
    params.require(:favo_comment).permit(:comment)
  end
end
