class CategoriesController < ApplicationController
  
  before_action :require_admin, except: [ :index, :show ]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "cateogry was succesfully created"
      redirect_to @category
    else
      render 'new'
    end

  end

  def index
    @categories = Category.all

  end

  def show
    @category = Category.find(params[:id])
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
        flash[:alert] = "only admins can perform that action"
        redirect_to categories_path
    end
  end



end