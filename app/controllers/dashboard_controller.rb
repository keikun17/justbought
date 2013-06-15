class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = []
    5.times do 
      @posts << PostPresenter.new
    end
  end

end
