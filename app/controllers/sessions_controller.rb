class SessionsController < ApplicationController
  
  before_filter :logged_in?
  
  def new
    if logged_in?
      redirect_to workouts_url
    else
      @user = User.new
    end
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:uid] = user.id
      redirect_to root_url, notice: "Thank you for logging in."
    else
      redirect_to new_sessions_url, notice: "There was an error logging you in. Please try again."
    end      
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: "You have successfully logged out."
  end

end
