class PostsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @post = current_user.posts.new(post_params.merge(currency: current_user.currency))
    if @post.save
      redirect_to root_path, flash: { success: "Yobong nomon" }
    else
      redirect_to root_path, flash: { error: @post.errors.full_messages.to_sentence }
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to :back
  end

  def like
    @post = Post.find(params[:id])
    current_user.like(@post)

    redirect_to :back, flash: { success: "Liked" }
  end

  def unlike
    @post = Post.find(params[:id])
    current_user.unlike(@post)

    redirect_to :back, flash: { success: "Unliked" }
  end

  private

  def post_params
    params.require(:post).permit(:raw_comment)
  end
end
