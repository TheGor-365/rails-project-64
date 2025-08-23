# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(fetch_post_id!)
    current_user.likes.create_or_find_by!(post: post)

    respond_to do |f|
      f.turbo_stream { redirect_to(post_path(post, locale: I18n.locale)) }
      f.html         { redirect_to(post_path(post, locale: I18n.locale)) }
    end
  rescue ActiveRecord::RecordNotFound
    not_found_like
  end

  def destroy
    like = current_user.likes.find(params[:id])
    post = like.post
    like.destroy!

    respond_to do |f|
      f.turbo_stream { redirect_to(post_path(post, locale: I18n.locale)) }
      f.html         { redirect_to(post_path(post, locale: I18n.locale)) }
    end
  rescue ActiveRecord::RecordNotFound
    not_found_like
  end

  private

  def fetch_post_id!
    params.dig(:like, :post_id) || params[:post_id] || raise(ActiveRecord::RecordNotFound)
  end

  def not_found_like
    respond_to do |f|
      f.turbo_stream { head(:not_found) }
      f.html { redirect_back(fallback_location: root_path, alert: I18n.t('errors.like_not_found', default: 'Like not found')) }
    end
  end
end
