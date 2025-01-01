# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    @comment = post_comments(:one)
    self.default_url_options = { locale: I18n.default_locale }
  end

  test 'should get create' do
    @user = users(:one)

    get new_post_url
    assert_response :success

    new_post = {
      post: {
        title: Faker::Lorem.word,
        body: Faker::Lorem.sentence(word_count: 25, supplemental: true),
        category: @category,
        creator: @user
      }
    }

    new_comment = {
      comment: {
        user_id: @user,
        post_id: new_post,
        content: Faker::Lorem.sentence(word_count: 25, supplemental: true),
        ancestry: '/'
      }
    }

    assert { new_comment }
    assert_response :success
  end
end
