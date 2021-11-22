class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # ruby on rails Sessions controller guide:  https://guides.rubyonrails.org/action_controller_overview.html#session
      session[:user_id] = user.id # ruby session method, set to the user by the id, can also store other information (preferred language etc)
      flash[:notice] = "logged in succesfully"
      redirect_to user # redirects to user's show page upon successful login
    else
      flash.now[:alert] = "there was something wrong with your login details . . " # flash.now  because we are not redirecting the user, we are just rendering the template again
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil # destroy the session / sign out
    flash[:notice] = "logged out"
    redirect_to root_path
  end
end
