# frozen_string_literal: true

SimpleForm.setup do |config|
  config.label_text = ->(label, required, _explicit_label) { "#{label} #{required}" }

  config.wrappers :vertical_form, tag: 'div', class: 'mb-3' do |b|
    b.use :label
    b.use :input, class: 'form-control'
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  config.wrappers :inline_checkbox, tag: 'div', class: 'form-check form-check-inline' do |b|
    b.use :input, class: 'form-check-input'
    b.use :label, class: 'form-check-label'
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
  end

  config.default_wrapper = :vertical_form
end
