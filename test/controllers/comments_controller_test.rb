# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
  end

  test 'POST /posts/:id/comments creates root comment' do
    attrs = { post_comment: { content: Faker::Lorem.sentence(word_count: 10) } }

    assert_difference('PostComment.count', +1) do
      post post_comments_url(@post), params: attrs
    end

    created = PostComment.find_by(
      post: @post, user: users(:one), content: attrs[:post_comment][:content]
    )
    assert { created }

    follow_redirect!
    assert_response :success
  end
end
