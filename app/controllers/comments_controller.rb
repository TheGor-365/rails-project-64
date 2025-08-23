# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user    = current_user
    @comment.creator = current_user

    if @comment.save
      respond_to do |f|
        f.turbo_stream
        f.html { redirect_to post_path(@post, locale: I18n.locale) }
      end
    else
      respond_to do |f|
        f.turbo_stream { head :unprocessable_entity }
        f.html { redirect_to post_path(@post, locale: I18n.locale), alert: @comment.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    key = params[:post_comment].present? ? :post_comment : :comment
    params.require(key).permit(:content, :parent_id)
  end
end
