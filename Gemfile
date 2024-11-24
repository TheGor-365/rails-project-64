# frozen_string_literal: false

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8", ">= 7.0.8.1"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "devise", "~> 4.9"
gem "simple_form", "~> 5.3"
gem 'minitest-power_assert'
gem "image_processing", "~> 1.2"
gem "stackprof"
gem "sentry-ruby"
gem "sentry-rails"
gem 'ancestry'

# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
# gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
  gem 'slim_lint'
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop', require: false
  gem 'faker'
end

group :development do
  gem "web-console"

  # gem "rack-mini-profiler"
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  gem 'pg'
end
