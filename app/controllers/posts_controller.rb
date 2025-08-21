# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_post, only: %i[show]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

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
      :creator_id,
      :category_id,
    )
  end
end
