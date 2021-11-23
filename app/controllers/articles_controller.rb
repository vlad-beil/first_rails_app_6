class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :author, :description))
    if @article.save
      #redirect_to article_path(@article)
      flash[:notice] = "Article was created succssfully!"
      redirect_to @article
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :author, :description))
      #redirect_to article_path(@article)
      flash[:notice] = "Article was updated succssfully!"
      redirect_to @article
    else
      render "edit"
    end
  end

  def show
    #byebug
    @article = Article.find(params[:id])
  end
end
