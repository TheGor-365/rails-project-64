# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get posts' do
    get root_url
    assert_response :success
  end
end
