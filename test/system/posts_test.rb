# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
    @user = users(:user_one)
    @post.category = categories(:one)
  end

  test 'visiting the home' do
    email = Faker::Internet.email
    password = Faker::Internet.password(min_length: 10, max_length: 30)
    User.create(email: email, password: password)

    visit new_user_session_url

    fill_in 'Email', with: email
    fill_in 'Password', with: password

    click_on 'Log in'

    visit root_url
    assert_selector 'h1', text: 'Collective Blog'

    take_screenshot
  end

  # test 'should create post' do
  #   email = Faker::Internet.email
  #   password = Faker::Internet.password(min_length: 10, max_length: 30)
  #   User.create(email: email, password: password)
  #
  #   visit new_user_session_url
  #
  #   fill_in 'Email', with: email
  #   fill_in 'Password', with: password
  #
  #   click_on 'Log in'
  #
  #   visit new_post_url
  #
  #   fill_in 'Title', with: @post.title
  #   fill_in 'Category', with: 'R'
  #   fill_in 'Body', with: @post.body
  #
  #   click_on 'Create Post'
  #
  #   assert_text "Post was successfully created"
  #
  #   take_screenshot
  # end
end
