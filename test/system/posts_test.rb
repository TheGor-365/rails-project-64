# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
  end

  test 'should create post' do
    visit posts_url
    click_on 'New post'

    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end
end
