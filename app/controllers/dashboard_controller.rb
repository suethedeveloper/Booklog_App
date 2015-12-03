class DashboardController < ApplicationController
  def index
    @readers = User.all
  end
end
