class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_user

  before_action :logged_in?

  def logged_in?
    redirect_to '/login' if !current_user
  end

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

end
