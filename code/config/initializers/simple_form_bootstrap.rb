# frozen_string_literal: true

SimpleForm.setup do |config|
  config.wrappers :default,
                  class: :input,
                  hint_class: :field_with_hint,
                  error_class: :field_with_errors do |b|
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'text-danger' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'form-text' }
  end

  config.default_wrapper = :default

  config.label_text = ->(label, required, _explicit_label) { "#{label} #{required}" }
end
