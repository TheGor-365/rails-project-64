# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :authenticate_user!

  def show
    @post_creation_time = 'time_ago_in_words @post.created_at.strftime("%d %B, %h")'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to(post_url(@post), notice: t('.success'))
    else
      render(:new, notice: t('.failure'))
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :creator,
      :category_id
    )
  end
end
