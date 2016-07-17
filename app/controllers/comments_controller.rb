class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    parent_model = @comment.commentable_type
    if @comment.save
      if parent_model == "User"
        redirect_to user_url(@comment.commentable_id)
      else
        redirect_to goal_url(@comment.commentable_id)
      end
    else
      if parent_model == "User"
        flash[:errors] = @comment.errors.full_messages
        redirect_to user_url(@comment.commentable)
      else
        flash[:errors] = @comment.errors.full_messages
        redirect_to goal_url(@comment.commentable)
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
