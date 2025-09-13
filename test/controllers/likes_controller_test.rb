# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post_with_like    = posts(:one)
    @post_without_like = posts(:two)
  end

  test 'POST /posts/:post_id/likes likes a post without existing like' do
    assert_difference('PostLike.count', +1) do
      post post_likes_url(@post_without_like)
    end

    created = PostLike.find_by(user: users(:one), post: @post_without_like)
    assert { created }

    follow_redirect!
    assert_response :success
  end

  test 'DELETE /posts/:post_id/likes/:id unlikes a post' do
    like = PostLike.find_by!(user: users(:one), post: @post_with_like)

    assert_difference('PostLike.count', -1) do
      delete post_like_url(@post_with_like, like)
    end

    follow_redirect!
    assert_response :success
  end
end
