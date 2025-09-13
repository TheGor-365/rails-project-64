# frozen_string_literal: true

require 'application_system_test_case'
require 'warden/test/helpers'

class PostsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  def teardown
    Warden.test_reset!
    super
  end

  test 'visiting the home' do
    user = users(:one)
    login_as user, scope: :user

    visit root_url
    assert_selector 'h1', text: 'Collective Blog'

    take_screenshot
  end
end
