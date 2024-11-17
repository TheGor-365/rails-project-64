# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    flash[:notice] = @like.errors.full_messages.to_sentense unless @like.save
    redirect_to(@like.post)
  end

  def destroy
    @user = current_user
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy!
    redirect_to(post)
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
