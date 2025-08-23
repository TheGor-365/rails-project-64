# frozen_string_literal: true

# See https://github.com/heartcombo/simple_form#custom-components
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }

SimpleForm.setup do |config|
  config.wrappers(:default, class: :input,
                            hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors) do |b|
    b.use(:html5)
    b.use(:placeholder)
    b.optional(:maxlength)
    b.optional(:minlength)
    b.optional(:pattern)
    b.optional(:min_max)
    b.optional(:readonly)
    # b.use :input, class: 'input', error_class: 'is-invalid', valid_class: 'is-valid'
    b.use(:label_input)
    b.use(:hint,  wrap_with: { tag: :span, class: :hint })
    b.use(:error, wrap_with: { tag: :span, class: :error })
    # b.use :full_error, wrap_with: { tag: :span, class: :error }
  end

  config.default_wrapper = :default
  #   inline: input + label
  #   nested: label > input
  config.boolean_style = :nested
  config.button_class = 'btn'
  # config.error_method = :first
  config.error_notification_tag = :div
  config.error_notification_class = 'error_notification'
  # config.collection_label_methods = [ :to_label, :name, :title, :to_s ]
  # config.collection_value_methods = [ :id, :to_s ]
  # config.collection_wrapper_tag = nil
  # config.collection_wrapper_class = nil
  # defaulting to :span.
  # config.item_wrapper_tag = :span
  # config.item_wrapper_class = nil
  # config.label_text = lambda { |label, required, explicit_label| "#{required} #{label}" }
  # config.label_class = nil
  # with `html: { :class }`. Defaulting to none.
  # config.default_form_class = nil
  # config.generate_additional_classes_for = [:wrapper, :label, :input]
  # config.required_by_default = true
  config.browser_validations = false
  # config.input_mappings = { /count/ => :integer }
  # config.wrapper_mappings = { string: :prepend }
  # config.custom_inputs_namespaces << "CustomInputs"
  # config.time_zone_priority = nil
  # config.country_priority = nil
  # config.translate_labels = true
  # config.inputs_discovery = true
  # config.cache_discovery = !Rails.env.development?
  # config.input_class = nil
  config.boolean_label_class = 'checkbox'
  # collection wrappers.
  # config.include_default_input_wrapper_class = true
  # config.i18n_scope = 'simple_form'
  # config.input_field_valid_class = 'is-valid'
  # config.input_field_error_class = 'is-invalid'
end
