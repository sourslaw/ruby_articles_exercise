class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? # makes availabe to the Views as well, not just the Application controller

  def current_user # return the details of the logged in user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # give us user object from the users table, then we can access whatever information we need. referemcers current_users
  
  end

  def logged_in? # check if user is logged in
    !!current_user # turns current_user into boolean. returns True or False
    
  end

end
