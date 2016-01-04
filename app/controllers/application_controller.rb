class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Prevents access to pages without a set session
  def require_login
  	redirect_to '/sessions/new' if session[:user_id] == nil
  end

  # Sets the user dashboard as the default homepage for logged in users
  def login_home
    redirect_to '/prospects/show' if session[:user_id]
  end

  # Show element only if the session user_id is set
  def current_user
  	Client.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
