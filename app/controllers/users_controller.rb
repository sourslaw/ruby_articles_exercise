class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # byebug

    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "welcome to the blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update( user_params ) # make title and description available to use
      flash[:notice] = "you user account information was successfully updated"
      redirect_to articles_path
    else
      render 'edit' # render/go to this page
    end
    
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password) # require and permit the article object
  end

end