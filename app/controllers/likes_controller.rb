# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.likes.find_or_initialize_by(post_id: like_params[:post_id])
    like.save
    redirect_to like.post
  end

  def destroy
    like = current_user.likes.find(params[:id])
    post = like.post
    like.destroy
    redirect_to post
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
