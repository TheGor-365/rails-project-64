# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
    @user = users(:one)
    @post.category = categories(:one)
  end

  test 'visiting the home' do
    email = Faker::Internet.email
    password = Faker::Internet.password(min_length: 10, max_length: 30)
    User.create!(email:, password:)

    visit new_user_session_url

    fill_in 'Email', with: email
    fill_in 'Password', with: password

    click_on 'Log in'

    visit root_url
    assert_selector 'h1', text: 'Collective Blog'

    take_screenshot
  end
end
