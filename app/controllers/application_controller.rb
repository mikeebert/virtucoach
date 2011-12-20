class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?
  helper_method :current_user

  def logged_in?
    session[:uid]
  end

  def current_user
    User.find_by_id(session[:uid])
  end

  def require_user
    redirect_to new_sessions_url, notice: "You must be logged into use this feature" unless logged_in?
  end

  def selected_user
    if params[:user_id].present? && params[:user_id].to_i != current_user.id
      teammate = current_user.teammates.find_by_owner_id(params[:user_id])
      # logger.debug "teammate id is #{teammate.id}"
      if teammate.blank?
        redirect_to root_url, :notice => "You do not have access to that user."
        return
      end
      @user = teammate.owner
    else
      @user = current_user      
    end    
  end

  def find_workout
    @workout = @user.workouts.find_by_id(params[:id])
  end
  
end
