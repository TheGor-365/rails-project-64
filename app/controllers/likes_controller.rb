# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.find_or_initialize_by(post: post)
    like.save!

    respond_to do |f|
      f.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(post, :like), partial: 'posts/like', locals: { post: }) }
      f.html         { redirect_back(fallback_location: post_path(post)) }
    end
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id])
    return not_found_like unless like

    post = like.post
    like.destroy! if like.user_id == current_user.id

    respond_to do |f|
      f.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(post, :like), partial: 'posts/like', locals: { post: }) }
      f.html         { redirect_back(fallback_location: post_path(post)) }
    end
  end

  private

  # helper: формируем id фрейма как в вьюхе
  def dom_id(record, suffix)
    "#{record.model_name.element}_#{record.id}_#{suffix}" # => "post_#{id}_like"
  end

  def not_found_like
    respond_to do |f|
      f.turbo_stream { head :not_found }
      f.html { redirect_back fallback_location: root_path, alert: I18n.t('errors.like_not_found', default: 'Like not found') }
    end
  end
end
