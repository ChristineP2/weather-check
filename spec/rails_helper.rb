# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

# Prevent database truncation if the environment is production
if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
#

RSpec.configure do |config|
  # Remove this line to enable support for ActiveRecord

  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.include FactoryBot::Syntax::Methods
  Shoulda::Matchers.configure do |should_config|
    should_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end

# rubocop:disable Metrics/MethodLength

def mock_api_response
  [
    200,
    { 'Content-Type': 'application/json' },
    mock_forecast_response
  ]
end

# FIXME: Create shared mock data
def mock_forecast_response
  {
    'forecast' => {
      'forecastday' => [
        {
          'date' => '2023-02-07',
          'day'  => {
            'avgtemp_c'            => 12.0,
            'avgtemp_f'            => 53.6,
            'condition'            => {
              'code' => 1000,
              'icon' => '//cdn.weatherapi.com/weather/64x64/day/113.png',
              'text' => 'Sunny'
            },
            'daily_chance_of_rain' => '10',
            'daily_chance_of_snow' => '0',
            'daily_will_it_rain'   => false,
            'daily_will_it_snow'   => false,
            'maxtemp_c'            => 15.0,
            'maxtemp_f'            => 59.0,
            'mintemp_c'            => 9.0,
            'mintemp_f'            => 48.2,
            'totalprecip_mm'       => 10,
            'totalprecip_in'       => 0.2,
            'totalsnow_cm'         => 10.0
          }
        }
        # Additional forecast data for other days
      ]
    }
  }
end

# rubocop:enable Metrics/MethodLength
