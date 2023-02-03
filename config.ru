# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

if ENV['RAILS_HOSTNAME'].present?
  use Rack::CanonicalHost,
      ENV.fetch('RAILS_HOSTNAME', nil)
end
run Rails.application
Rails.application.load_server
