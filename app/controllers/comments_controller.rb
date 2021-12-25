class CommentsController < ApplicationController
  before_action :require_logged_in
  
  def create
    @comment = current_user.comments.build(comment_params)
    
    @room = Room.find_by(id: @comment.room_id)
    
    @comments = @room.comments
    
    if @comment.save
      render :create
    else
      render :error
    end
  end

  def destroy
    Comment.find_by(id: params[:id], room_id: params[:room_id]).destroy
    flash[:success] = 'コメントを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :room_id)
  end
  
  def correct_comment
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
