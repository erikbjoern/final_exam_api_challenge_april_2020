class Api::CommentsController < ApplicationController
  def create
    comment = Comment.create(content: params[:content], article_id: params[:article_id])
    if comment.persisted?
      render json: { message: "Your comment was succesfully posted" }
    end
  end
end
