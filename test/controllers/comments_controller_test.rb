# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    self.default_url_options = { locale: I18n.default_locale }
  end

  test 'POST /posts/:id/comments creates root comment' do
    attrs = { comment: { content: Faker::Lorem.sentence(word_count: 10) } }
    assert_difference('PostComment.count', +1) do
      post post_comments_url(@post), params: attrs
    end
    follow_redirect!
    assert_response :success
  end
end
