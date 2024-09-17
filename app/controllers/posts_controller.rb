# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, except: [:show]
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
    @comment = PostComment.new(post_id: params[:post_id], parent_id: params[:parent_id])
  end

  def new
    @post = Post.new
    @user = current_user
    @comment = PostComment.new(post_id: params[:post_id], parent_id: params[:parent_id])
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
