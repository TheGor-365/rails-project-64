# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)

    @post = posts(:one)
  end

  # test 'get new' do
  #   get new_post_url
  #   assert_response :success
  # end
end
