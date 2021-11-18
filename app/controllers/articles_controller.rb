class ArticlesController < ApplicationController

  before_action :set_article, only: [ :show, :edit, :update, :destroy ]


  def show
    # byebug
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new( article_params ) 
    @article.user = User.first
    
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

end
