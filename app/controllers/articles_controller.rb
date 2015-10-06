class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def create
    # We don't need a template for some actions. just redirects
    # Make sure you have the params included
    @article = Article.new(article_params)
    @article.save
    # This the page to redirect to
    redirect_to article_path(@article)
  end

end
