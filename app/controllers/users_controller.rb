class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.decorate
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)

    redirect_to @user, flash: { success: "Friend has been added" }
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to @user, flash: { success: "Friend has been unfollowed" }
  end
end
