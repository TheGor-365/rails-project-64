# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @post = set_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(creator: current_user))

    if @post.save
      redirect_to(post_url(@post), notice: t('.success'))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def set_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
