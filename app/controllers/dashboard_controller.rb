class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.new
    @posts = current_user.friends_posts.decorate

  end

end
