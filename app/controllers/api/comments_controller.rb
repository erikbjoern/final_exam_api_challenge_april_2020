class Api::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    comment = Comment.create(content: params[:content], article_id: params[:article_id])
    binding.pry
    if comment.persisted?
      render json: { message: "Your comment was successfully posted" }
    end
  end
end
