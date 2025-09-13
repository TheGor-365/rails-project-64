# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @category = categories(:one)
    @post = posts(:one)
  end

  test 'GET /posts/:id shows post' do
    get post_url(@post)
    assert_response :success
    assert_includes @response.body, @post.title
  end

  test 'GET /posts/new' do
    get new_post_url
    assert_response :success
  end

  test 'POST /posts creates post with correct attributes' do
    attrs = {
      post: {
        title: Faker::Lorem.sentence(word_count: 3),
        body: Faker::Lorem.paragraph_by_chars(number: 220),
        category_id: @category.id
      }
    }

    assert_difference('Post.count', +1) do
      post posts_url, params: attrs
    end

    created = Post.find_by(
      title: attrs[:post][:title],
      body: attrs[:post][:body],
      category_id: @category.id,
      creator_id: users(:one).id
    )
    assert { created }

    follow_redirect!
    assert_response :success
  end
end
