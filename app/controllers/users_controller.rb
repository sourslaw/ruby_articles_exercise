class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]


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


  private

  def user_params
    params.require(:user).permit(:username, :email, :password) # require and permit the article object
  end

  def set_user
    @user = User.find(params[:id])
  end

end