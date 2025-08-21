# frozen_string_literal: true
require 'test_helper'
class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @category = categories(:one)
    self.default_url_options = { locale: I18n.default_locale }
  end

  test 'GET /posts/new' do
    get new_post_url
    assert_response :success
  end

  test 'POST /posts creates post' do
    attrs = {
      post: {
        title:       Faker::Lorem.sentence(word_count: 3),
        body:        Faker::Lorem.paragraph_by_chars(number: 220),
        category_id: @category.id
      }
    }
    assert_difference('Post.count', +1) do
      post posts_url, params: attrs
    end
    follow_redirect!
    assert_response :success
  end
end
