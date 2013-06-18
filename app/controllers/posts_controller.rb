class PostsController < ApplicationController

  def create
    @post = current_user.posts.create(post_params)
    redirect_to root_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to :back
  end
  private

  def post_params
    params.require(:post).permit(:raw_comment)
  end
end
