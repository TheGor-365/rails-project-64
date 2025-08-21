# frozen_string_literal: true

require 'logger'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
require 'bootsnap/setup'
