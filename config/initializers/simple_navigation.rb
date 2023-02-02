# frozen_string_literal: true

require 'simple_navigation'

SimpleNavigation::Configuration.run do |navigation|
  navigation.auto_highlight = true
  navigation.selected_class = 'is-active'
end

Rails.application.reloader.to_prepare do
  SimpleNavigation.register_renderer(bulma_main_nav: Nav::BulmaMainNav)
  SimpleNavigation.register_renderer(bulma_breadcrumbs: Nav::BulmaBreadcrumbs)
end
