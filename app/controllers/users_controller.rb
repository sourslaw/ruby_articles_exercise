class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy ]
  before_action :require_user, except: [ :show, :index, :new, :create ] # using the require_user helper 
  before_action :require_same_user, only: [ :edit, :update, :destroy ]

  def show
  end

  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def create
    # byebug

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "welcome to the blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @user.update( user_params ) # make title and description available to use
      flash[:notice] = "you user account information was successfully updated"
      redirect_to @user
    else
      render 'edit' # render/go to this page
    end
    
  end

  def destroy
    @user.destroy
    session[:user_id] = nil # destroy the session id after the user is gone. if not, will throw error, as it will look for this cookie
    flash[:notice] = "your user account and all associated articles were successfully deleted"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password) # require and permit the article object
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "you can only edit your own profile"
      redirect_to @user
    end
  end

end