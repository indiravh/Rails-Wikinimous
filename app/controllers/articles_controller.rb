class ArticlesController < ApplicationController

    # line below will call #set_task method before specified actions
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = article.find(params[:id])
  end

  def new
    @article = article.new # needed to instantiate the form_for
  end

  def create
    @article = article.new(article_params)
    @article.save
    redirect_to article_path(@article) # redirect to index list via article_path
  end

  def edit
    @article = article.find(params[:id])
  end

   def update
    @article = article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :details, :completed)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
