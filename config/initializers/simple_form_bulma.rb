# frozen_string_literal: true

# https://github.com/heartcombo/simple_form/wiki/Bulma-integration

# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components
# to know more about custom components.

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Default class for buttons
  config.button_class = 'button'

  # Define the default class of the input wrapper of the boolean input.
  config.boolean_label_class = 'checkbox'

  # How the label text should be generated altogether with the required text.
  config.label_text = lambda do |label, required, _explicit_label|
    "#{label} #{required}"
  end

  # Define the way to render check boxes / radio buttons with labels.
  config.boolean_style = :inline

  # You can wrap each item in a collection of radio/check boxes with a tag
  config.item_wrapper_tag = :div

  # Defines if the default input wrapper class should be included in radio
  # collection wrappers.
  config.include_default_input_wrapper_class = false

  # CSS class to add for error notification helper.
  config.error_notification_tag = :div
  config.error_notification_class = 'notification is-danger'

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :to_sentence

  # add validation classes to `input_field`
  config.input_field_error_class = 'is-danger'
  config.input_field_valid_class = 'is-success'
  config.browser_validations = true
  # ##########################
  #    DEFAULT (VERTICAL)
  # ##########################

  config.wrappers(:vertical_form, tag: 'div', class: 'field') do |b|
    b.use(:html5)
    b.use(:placeholder)
    b.optional(:maxlength)
    b.optional(:minlength)
    b.optional(:pattern)
    b.optional(:min_max)
    b.optional(:readonly)
    b.use(:label, class: 'label')
    b.use(:input, class: 'input', wrap_with: { tag: 'div', class: 'control' },
                  error_class: 'is-danger', valid_class: 'is-success')
    b.use(:full_error, wrap_with: { tag: 'p', class: 'help is-danger' })
    b.use(:hint, wrap_with: { tag: 'p', class: 'help is-info-dark' })
  end

  # bulma vertical select_form
  config.wrappers(:vertical_select, tag: 'div', class: 'control') do |b|
    b.use(:html5)
    b.use(:placeholder)
    b.optional(:pattern)
    b.optional(:readonly)
    b.use(:label, class: 'label')
    b.use(:input, wrap_with: { tag: 'div', class: 'select' })
    b.use(:full_error, wrap_with: { tag: 'p', class: 'help is-danger' })
    b.use(:hint, wrap_with: { tag: 'p', class: 'help is-info-dark' })
  end

  config.wrappers(:select2, tag: 'div', class: '') do |b|
    b.use(:html5)
    b.use(:placeholder)
    b.optional(:pattern)
    b.optional(:readonly)
    b.use(:label, class: 'label')
    # Using is-multiple to hide the arrow from Bulma
    b.use(:input, 'data-selectTwo': '', class: 'select2-min-width is-multiple')
    b.use(:full_error, wrap_with: { tag: 'p', class: 'help is-danger' })
    b.use(:hint, wrap_with: { tag: 'p', class: 'help is-info-dark' })
  end

  # bulma extension vertical input for boolean
  config.wrappers(:vertical_boolean, tag: 'div', class: 'field') do |b|
    b.use(:html5)
    b.optional(:readonly)
    b.use(:input, class: 'checkbox')
    b.use(:label, class: 'checkbox')
    # b.wrapper :form_check_wrapper, tag: "div", class: "control" do |bb|
    # bb.use :input, wrap_with: { tag: "label", class: "checkbox" }
    # bb.use :label, class: "checkbox"
    # bb.use(:full_error, wrap_with: { tag: "p", class: "help is-danger" })
    # bb.use(:hint, wrap_with: { tag: "p", class: "help is-info-dark" })
    # end
  end

  ## bulma vertical file input
  config.wrappers(:vertical_file, tag: 'div', class: 'field') do |b|
    b.use(:html5)
    b.optional(:readonly)
    b.wrapper(tag: 'label', class: 'file-label') do |ba|
      ba.use(:input, class: 'file-input')
      ba.use(:file_button)
    end
    b.use(:full_error, wrap_with: { tag: 'p', class: 'help is-danger' })
    b.use(:hint, wrap_with: { tag: 'p', class: 'help is-info-dark' })
  end

  ## bulma vertical multi select
  config.wrappers(:vertical_multi_select, tag: 'div', class: 'field') do |b|
    b.use(:html5)
    b.optional(:readonly)
    b.use(:label, class: 'label')
    b.wrapper(tag: 'div', class: 'control') do |ba|
      ba.use(:input, class: 'input', error_class: 'is-danger',
                     valid_class: 'is-success')
    end
    b.use(:full_error, wrap_with: { tag: 'p', class: 'help is-danger' })
    b.use(:hint, wrap_with: { tag: 'p', class: 'help is-info-dark' })
  end

  # ##########################
  #    One Line Form (wraps if needed)
  # ##########################
  config.wrappers(
    :horizontal_form, tag: 'div', class: 'field is-inline-block horizontal-form'
  ) do |a|
    a.use(:html5)
    a.use(:placeholder)
    a.optional(:maxlength)
    a.optional(:minlength)
    a.optional(:pattern)
    a.optional(:min_max)
    a.optional(:readonly)
    a.use(:label, class: 'label')
    a.use(:input, class: 'input',
                  wrap_with: { tag: 'div', class: 'control title' },
                  error_class: 'is-danger', valid_class: 'is-success',
                  placeholder: true)
    # a.use(:full_error, wrap_with: { tag: "p", class: "help is-danger" })
    # a.use(:hint, wrap_with: { tag: "p", class: "help is-info-dark" })
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :vertical_form

  # Custom wrappers for input types. This should be a hash
  # containing an input type as key and the wrapper that
  # will be used for all inputs with specified type.
  config.wrapper_mappings = {
    boolean:       :vertical_boolean,
    select:        :select2,
    check_boxes:   :vertical_collection,
    file:          :vertical_file,
    radio_buttons: :vertical_collection,
    range:         :vertical_range,
    time:          :vertical_multi_select
  }
end
