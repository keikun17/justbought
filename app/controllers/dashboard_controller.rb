class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.new
    @posts = current_user.friends_posts.paginate(page: params[:page], per_page: 5)
  end

end
