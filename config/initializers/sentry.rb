# frozen_string_literal: true

Sentry.init do |config|
  config.breadcrumbs_logger = [:active_support_logger]
  config.dsn = ENV.fetch('SENTRY_DSN', nil)
  config.enable_tracing = true
end
