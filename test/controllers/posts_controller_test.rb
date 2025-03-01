# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    self.default_url_options = { locale: I18n.default_locale }
  end

  test 'visiting the home' do
    get root_url

    assert_response :success
  end

  test 'authenticated users can see posts' do
    get root_path
    assert_response :success
    @post = posts(:one)
  end

  test 'get new' do
    get new_post_url
    assert_response :success
  end

  test 'should get create' do
    @user = users(:one)
    @category = categories(:one)

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

    assert { new_post }
    assert_response :success
  end
end
