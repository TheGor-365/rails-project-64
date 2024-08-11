# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show]

  def new
    @comment = PostComment.new
    @comments = PostComment.all
  end

  def create
    @comment = PostComment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @post = PostComment.find(params[:id])
  end

  def comment_params
     params.require(:post_comment).permit(
       :content,
       :ancestry,
       :post_id,
       :user_id
     )
  end
end
