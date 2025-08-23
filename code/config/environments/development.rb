# frozen_string_literal: true

Rails.application.configure do
  # Кэш-классa и eageload в dev отключены
  config.cache_classes = false
  config.eager_load = false

  # Подробные ошибки
  config.consider_all_requests_local = true
  config.server_timing = true

  # Кэширование выключено по умолчанию
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Active Storage локально
  config.active_storage.service = :local

  # Почта
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # Депрекейшены
  config.active_support.deprecation = :log
  config.active_support.report_deprecations = false

  # Миграции
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  # Логи ассетов потише
  config.assets.quiet = true

  # i18n: не кидаем исключения на отсутствующие переводы в dev
  config.i18n.raise_on_missing_translations = false
end
