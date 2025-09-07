# frozen_string_literal: true

class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |f|
        f.turbo_stream
        f.html { redirect_to(post_path(@post, locale: I18n.locale)) }
      end
    else
      respond_to do |f|
        f.turbo_stream { render_validation_errors_turbo_stream(@comment) }
        f.html { redirect_to(post_path(@post, locale: I18n.locale), alert: @comment.errors.full_messages.to_sentence) }
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

  # Показываем ошибки только в той форме, из которой была отправка.
  # Для reply — перерисовываем collapse и оставляем его открытым.
  def render_validation_errors_turbo_stream(comment)
    if comment.parent_id.present?
      render turbo_stream: turbo_stream.replace(
        dom_id(comment.parent, :reply_collapse),
        partial: 'post_comments/reply_collapse',
        locals: { post: @post, parent: comment.parent, post_comment: comment, force_show: true }
      )
    else
      render turbo_stream: turbo_stream.replace(
        dom_id(@post, :new_comment),
        partial: 'post_comments/form',
        locals: { post: @post, post_comment: comment }
      )
    end
  end
end
