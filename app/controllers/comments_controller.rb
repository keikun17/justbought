class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params.merge({user_id: current_user.id}))
    redirect_to :back
  end

  def destroy
    @comment = current_user.comments.where(id: params[:id], post_id: params[:post_id])
    @comment.delete_all
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
