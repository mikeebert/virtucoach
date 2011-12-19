class WorkoutsController < ApplicationController

  before_filter :require_user
  before_filter :current_user
  
  before_filter :find_workout, :only => [:show, :edit, :destroy]
  
  def find_workout
    @workout = current_user.workouts.find(params[:id])
  end
  
  def index
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    date = @date  
    
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    @workouts = @user.workouts.selected_month(date)
    @workouts_cal = @user.workouts
    @comments = current_user.comments.order("created_at desc").limit(10)
  end
  
  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.build(params[:workout])
    
    if @workout.save
      respond_to do |format|
        format.html {redirect_to workouts_url, notice:"Workout #{@workout.name} Added for #{@workout.date}"}
      end
    else
        render :new, notice: "There was an error creating your workout."
    end
  end
  
  def show
    @comments = @workout.comments.all
  end
  
  def edit
  end
  
  def update
    @workout = Workout.find(params[:id])
    @workout.update_attributes(params[:workout])    
    if @workout.save
      respond_to do |format|
        format.html {redirect_to workouts_url, notice:"Workout updated for #{@workout.date.strftime("%B %d")}."}
      end
    else
      render :edit, notice: "There was an error updating your workout."      
    end

  end
  
  def destroy
    @workout.destroy    
    redirect_to workouts_url, notice: "Your workout has been deleted."    
  end
  
  
end
