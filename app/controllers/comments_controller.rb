# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = current_user.comments.new(comment_params.merge(post_id: @post.id))
    flash[:notice] = @comment.errors.full_messages.to_sentence unless @comment.save

    redirect_to(post_path(@post))
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.fetch(:post_comment, params.fetch(:comment, {})).permit(:content, :parent_id)
  end
end
