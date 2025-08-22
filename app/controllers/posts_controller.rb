# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_post, only: %i[show]

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(creator: current_user))

    if @post.save
      respond_to do |f|
        # f.turbo_stream { head(:ok) }
        f.html         { redirect_to(post_url(@post)) }
      end
    else
      respond_to do |f|
        # f.turbo_stream { head(:unprocessable_entity) }
        f.html         { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
