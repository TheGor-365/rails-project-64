# frozen_string_literal: true

SimpleForm.setup do |config|
  config.wrappers :default, class: :input do |b|
    b.use :label
    b.use :input
    b.use :full_error, wrap_with: { tag: :span, class: :error }
    b.use :hint, wrap_with: { tag: :span, class: :hint }
  end

  config.default_wrapper = :default
end
