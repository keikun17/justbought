class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.new
    @posts = current_user.posts.decorate

  end

end
