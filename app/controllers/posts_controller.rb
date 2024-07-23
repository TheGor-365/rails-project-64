# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

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
    params.fetch(:post, {})
  end
end
