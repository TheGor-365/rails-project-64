# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find_by(id: like_params[:post_id])
    return respond_missing_post unless post

    like = current_user.likes.find_or_initialize_by(post: post)
    ok = like.save

    respond_to do |f|
      if ok
        f.turbo_stream { head(:ok) }
        f.html         { redirect_to(post) }
      else
        f.turbo_stream { head(:unprocessable_entity) }
        f.html         { redirect_back(fallback_location: root_path) }
      end
    end
  end

  def destroy
    like = PostLike.find_by(id: params[:id])
    return respond_no_content unless like

    like.destroy! if like.user_id == current_user.id

    respond_to do |f|
      f.turbo_stream { head(:ok) }
      f.html         { redirect_to(like.post) }
    end
  end

  private

  def like_params
    params.fetch(:post_like, params.fetch(:like, {})).permit(:post_id)
  end

  def respond_missing_post
    respond_to do |f|
      f.turbo_stream { head(:not_found) }
      f.html         { redirect_back(fallback_location: root_path) }
    end
  end

  def respond_no_content
    respond_to do |f|
      f.turbo_stream { head(:ok) }
      f.html         { redirect_back(fallback_location: root_path) }
    end
  end
end
