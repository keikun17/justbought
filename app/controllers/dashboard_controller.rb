class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.new

    # @posts = current_user.feeds.decorate

    @posts = current_user.feeds
    @posts = PostDecorator.decorate_collection(@posts)

  end

end
