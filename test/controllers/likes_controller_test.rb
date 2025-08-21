# frozen_string_literal: true
require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    self.default_url_options = { locale: I18n.default_locale }
  end

  test 'POST /likes likes a post' do
    assert_difference('PostLike.count', +1) do
      post likes_url, params: { like: { post_id: @post.id } }
    end
    follow_redirect!
    assert_response :success
  end

  test 'DELETE /likes/:id unlikes a post' do
    like = PostLike.create!(user: users(:one), post: @post)
    assert_difference('PostLike.count', -1) do
      delete like_url(like)
    end
    follow_redirect!
    assert_response :success
  end
end
