# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      respond_to do |f|
        f.turbo_stream { head(:ok) }
        f.html         { redirect_to(@post) }
      end
    else
      respond_to do |f|
        f.turbo_stream { head(:unprocessable_entity) }
        f.html         { redirect_to(@post, alert: @comment.errors.full_messages.to_sentence) }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.fetch(:post_comment, {}).permit(:content, :parent_id)
  end
end
