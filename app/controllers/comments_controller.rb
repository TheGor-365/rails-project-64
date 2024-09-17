# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = current_user.comments.new(comment_params)

    flash[:notice] = @comment.errors.full_messages.to_sentence unless @comment.save
    redirect_to post_path(params[:post_id])
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(
      :content,
      :ancestry,
      :user_id,
      :parent_id
    ).merge(post_id: params[:post_id])
  end
end
