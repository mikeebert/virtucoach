class UsersController < ApplicationController
  
  before_filter :logged_in?   
  before_filter :set_user, :only => [:show, :edit, :update, :update_password, :destroy]
  
  def set_user
    @user = current_user
  end
  
  def new
    @user = User.new unless logged_in?
  end    
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:uid] = @user.id
      redirect_to root_url, notice: "Welcome to VirtuCoach! Your account has been successfully created."
    else
      render :new, notice: "There was an error creating your account. Please try again."
    end        
  end
  
  def show  
  end
  
  def edit 
  end
  
  def update
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to user_url(@user), notice: "Your account has been updated."
    else
      render :edit
    end  
  end
  
  def destroy
  end
    
end
