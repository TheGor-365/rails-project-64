# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_post, only: %i[show]

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |f|
      if @post.save
        f.turbo_stream { head(:ok) }
        f.html         { redirect_to(post_url(@post)) }
      else
        f.turbo_stream { head(:unprocessable_entity) }
        f.html do
          flash.now[:alert] = @post.errors.full_messages.to_sentence
          render(:new, status: :unprocessable_entity)
        end
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
