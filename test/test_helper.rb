# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest'
require 'minitest/autorun'
require 'minitest/power_assert'

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  fixtures :all
  include Devise::Test::IntegrationHelpers
end
