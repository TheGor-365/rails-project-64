# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @category = categories(:one)
    @post.creator_id = @user.id
  end

  test 'authenticated users can see posts' do
    sign_in @user

    get root_path
    assert_response :success
  end

  test 'get new' do
    sign_in @user

    get new_post_url
    assert_response :success
  end

  test 'should get create' do
    post(
      posts_url, params: {
        title: Faker::Lorem.word,
        body: Faker::Lorem.sentence(word_count: 25, supplemental: true),
        category: @category,
        creator: @user
      }
    )
    assert_redirected_to new_user_session_path
  end
end
