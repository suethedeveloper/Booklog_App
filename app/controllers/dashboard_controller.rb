class DashboardController < ApplicationController
  def index
    @readers = User.paginate(:page => params[:page])
  end

  def search
    @readers = User.search_by_name(params[:search_name]).paginate(:page => params[:page])
  end
end
