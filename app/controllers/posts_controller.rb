# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]
  before_action :authenticate_user!

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to(post_url(@post), notice: 'Post was successfully created.')
    else
      render(:new, status: :unprocessable_entity)
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
