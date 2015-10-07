class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    # @articles = Article.all
    @articles = Article.order('created_at DESC')
  end
  def show
    @article = Article.find(params[:id])
    # Due to the Rails’ mass-assignment protection, the article_id attribute of 
    # the new Comment object needs to be manually assigned with the id of the Article.
    @comment = Comment.new
    @comment.article_id = @article.id

  end
  def new
    @article = Article.new
  end
  def create
    # We don't need a template for some actions. just redirects
    # Make sure you have the params included
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Successfully created article"
    # This the page to redirect to
    redirect_to article_path(@article)
  end
  # For the edit action PATCH in browser
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    # Sends a popup message after an update has occurred
    flash.notice = "Article '#{@article.title}' Updated!"
    # After updating, redirect to that article
    redirect_to article_path(@article)
  end
  def edit
    @article = Article.find(params[:id])
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article deleted"
    redirect_to articles_path
  end
end
