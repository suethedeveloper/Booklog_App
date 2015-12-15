class ReadingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reading, except: [:index, :new, :create]

  def index  
    # @reading_logs = current_user.readings.all
    @reading_logs = current_user.readings.all.paginate(:page => params[:page])
    # binding.pry
    @friends = current_user.friends
  end

  def new
    @reading_log = current_user.readings.new
  end

  def create
    @reading_log = current_user.readings.new(reading_params)

    if @reading_log.save
      flash[:success] = "Reading log has been created" 
      redirect_to [current_user, @reading_log]
    else
      flash[:danger] = "Reading Log has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @reading_log.update(reading_params)
      flash[:success] = "Reading Log has been updated"
      redirect_to [current_user, @reading_log]
    else
      flash[:danger] = "Reading Log has not been updated"
      render :edit
    end
  end

  def show    
  end

  def destroy
    @reading_log.destroy
    flash[:success] = "Reading Log has been deleted"
    redirect_to user_readings_path(current_user)    
  end

  private
  def reading_params
    params.require(:reading).permit(:title, :author, :reading_date, :duration_in_min, :user_id, :note)
  end
  def set_reading
    @reading_log = current_user.readings.find(params[:id])
  end
end