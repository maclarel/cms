class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    # Note that this will do a database lookup every time.
    # This is not ideal, but seems to be the only way to get
    # this to work on Heroku right now.
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

end
