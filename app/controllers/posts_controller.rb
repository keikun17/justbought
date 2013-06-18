class PostsController < ApplicationController

  def create
    @post = current_user.posts.create(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:raw_comment)
  end
end
