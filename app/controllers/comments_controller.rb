# frozen_string_literal: true

class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user    = current_user
    @comment.creator = current_user

    if @comment.save
      respond_to do |f|
        f.turbo_stream
        f.html { redirect_to(post_path(@post, locale: I18n.locale)) }
      end
    else
      respond_to do |f|
        f.turbo_stream { render_turbo_comment_errors }
        f.html { redirect_to(post_path(@post, locale: I18n.locale), alert: @comment.errors.full_messages.to_sentence) }
      end
    end
  end

  private

  def render_turbo_comment_errors
    streams = []

    # Перерисовываем основную форму с ошибками
    streams << turbo_stream.replace(
      dom_id(@post, :new_comment),
      partial: 'post_comments/form',
      locals: { post: @post, post_comment: @comment }
    )

    # Если это reply — перерисовываем форму ответа и раскрываем коллапс
    if @comment.parent_id.present?
      parent = @comment.parent

      streams << turbo_stream.replace(
        dom_id(parent, :reply_form),
        partial: 'post_comments/reply_form',
        locals: { post: @post, parent: parent, post_comment: @comment }
      )

      streams << turbo_stream.replace(
        dom_id(parent, :reply_collapse),
        partial: 'post_comments/reply_collapse',
        locals: { post: @post, parent: parent, force_show: true }
      )
    end

    render turbo_stream: streams, status: :unprocessable_entity
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    key = params[:post_comment].present? ? :post_comment : :comment
    params.require(key).permit(:content, :parent_id)
  end
end
