require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RailsProject64
  class Application < Rails::Application
    config.load_defaults 7.0
    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :en
  end
end
