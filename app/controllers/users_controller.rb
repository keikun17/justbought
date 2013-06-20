class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.decorate
  end
end
