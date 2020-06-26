class Api::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    comment = current_user.comments.create(content: params[:content], article_id: params[:article_id])
    if comment.persisted?
      render json: { message: "Your comment was successfully posted" }
    else
      render json: { message: comment.errors.full_messages.to_sentence }, status: 422
    end
  end
end
