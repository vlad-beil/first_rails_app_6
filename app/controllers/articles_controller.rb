class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    #byebug
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params_whitelist)
    if @article.save
      #redirect_to article_path(@article)
      flash[:notice] = "Article was created succssfully!"
      redirect_to @article
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @article.update(article_params_whitelist)
      flash[:notice] = "Article was updated succssfully!"
      #redirect_to article_path(@article)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params_whitelist
    params.require(:article).permit(:title, :author, :description)
  end
end
