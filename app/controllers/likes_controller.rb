# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    current_user.likes.create!(post: post)

    respond_to do |f|
      f.turbo_stream { redirect_to(post_path(post, locale: I18n.locale)) }
      f.html         { redirect_to(post_path(post, locale: I18n.locale)) }
    end
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
    # если вдруг повторный лайк — просто ведём на пост (счётчик не изменится)
    redirect_to post_path(post, locale: I18n.locale)
  rescue ActiveRecord::RecordNotFound
    not_found_like
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find(params[:id])
    like.destroy!

    respond_to do |f|
      f.turbo_stream { redirect_to(post_path(post, locale: I18n.locale)) }
      f.html         { redirect_to(post_path(post, locale: I18n.locale)) }
    end
  rescue ActiveRecord::RecordNotFound
    not_found_like
  end

  private

  def not_found_like
    respond_to do |f|
      f.turbo_stream { head(:not_found) }
      f.html { redirect_back(fallback_location: root_path, alert: I18n.t('errors.like_not_found', default: 'Like not found')) }
    end
  end
end
