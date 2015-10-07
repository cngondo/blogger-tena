class CommentsController < ApplicationController
  include CommentsHelper
  def create
    @comment = Comment.new(comment_params)
    # Reference the comments to the ID of the article
    @comment.article_id = params[:article_id]
    @comment.save
    # After saving redirects to that exact same article
    redirect_to article_path(@comment.article)
  end
end
