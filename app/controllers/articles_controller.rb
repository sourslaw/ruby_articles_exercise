class ArticlesController < ApplicationController

  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  before_action :require_user, except: [ :show, :index ] # using the require_user helper 
  before_action :require_same_user, only: [ :edit, :update, :destroy ]

  def show
    # byebug
  end

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)

  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new( article_params ) 
    @article.user = current_user
    
    if @article.save
      flash[:notice] = "article was created successfully" # flash helper to signal successful posting of new article
      redirect_to @article # what do after the save. redirect to the article that was recreated
    else
      render 'new' # render/go to this page
    end
  end

  def update
    if @article.update( article_params ) # make title and description available to use
      flash[:notice] = "article successfully updated"
      redirect_to @article
    else
      render 'edit' # render/go to this page
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path # takes you to articles index page
  end


  private # only for use in this controller (not a class definition)

  def set_article
    @article = Article.find(params[:id]) # creating a instance variable. gets by :id
  end

  def article_params
    params.require(:article).permit(:title, :description) # require and permit the article object
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin? # if current_user is admin, do not redirect. if NOT current_user.admin AND current_user is not current article user, redirect
      flash[:alert] = "you can only edit or delete your own article"
      redirect_to @article
    end
  end

end
