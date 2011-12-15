class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?
  helper_method :current_user

  def logged_in?
    session[:uid].present?
  end

  def current_user
    User.find_by_id(session[:uid])
  end

  def require_user
    redirect_to new_sessions_url, notice: "You must be logged into use this feature" unless logged_in?
  end

end
