class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all    
  end
  
  def new 
    @comment = Comment.new
    @workout = Workout.find_by_id(params[:workout_id])
    @comment.workout = @workout
  end
  
  def create
    @comment = current_user.comments.build(params[:comment])

    if @comment.save
      respond_to do |format|
        format.html {redirect_to workouts_url}
      end
    else
      redirect_to new_comment_url, notice: "There was an error saving your comment."
    end

  end
  
  
end
