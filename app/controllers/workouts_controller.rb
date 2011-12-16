class WorkoutsController < ApplicationController

  before_filter :require_user
  before_filter :current_user
  
  before_filter :find_workout, :only => [:show, :edit, :update, :destroy]
  
  def find_workout
    @workout = current_user.workouts.find(params[:id])
  end
  
  def index
    @workouts = current_user.workouts
    @comments = current_user.comments.order("created_at desc")   
    logger.debug @comments.inspect  
  end
  
  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.build(params[:workout])
    
    if @workout.save
      respond_to do |format|
        format.html {redirect_to workouts_url, "Workout #{@workout.name} Added for #{@workout.date}"}
      end
    else
        render :new, notice: "There was an error creating your workout."
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @workout.update_atrributes(params[:workout])
    
    if @workout.save
      respond_to do |format|
        format.html {redirect_to workouts_url, "Workout #{@workout.name} Added for #{@workout.date}"}
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
