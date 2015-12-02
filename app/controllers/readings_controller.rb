class ReadingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reading, except: [:index, :new, :create]

  def index  
    @reading_logs = Reading.all
  end

  def new
    @reading = current_user.readings.new
  end

  def create
    @reading = current_user.readings.new(reading_params)

    if @reading.save
      flash[:success] = "Reading log has been created"          
      redirect_to [current_user, @reading]
    else
      flash[:danger] = "Reading Log has not been created"
      render :new
    end
  end

  def show
    
  end

  private
  def reading_params
    params.require(:reading).permit(:title, :author, :reading_date, :duration_in_min, :user_id, :note)
  end
  def set_reading
    @reading_log = current_user.readings.find(params[:id])
  end
end