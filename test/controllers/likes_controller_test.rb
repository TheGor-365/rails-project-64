# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    self.default_url_options = { locale: I18n.default_locale }
    # гарантируем чистое состояние: нет лайка user(:one) -> post(:one)
    PostLike.where(user: users(:one), post: @post).delete_all
  end

  test 'POST /posts/:post_id/likes likes a post' do
    assert_difference('PostLike.count', +1) do
      post post_likes_url(@post)
    end
    follow_redirect!
    assert_response :success
  end

  test 'DELETE /posts/:post_id/likes/:id unlikes a post' do
    like = PostLike.create!(user: users(:one), post: @post)
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@post, like)
    end
    follow_redirect!
    assert_response :success
  end
end
