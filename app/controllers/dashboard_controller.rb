class DashboardController < ApplicationController
  def index
    @readers = User.paginate(:page => params[:page])
  end
end
