# frozen_string_literal: true

class Secrets
  # FIXME: This would typically pull from a store such as the AWS SSM Parameter
  # store and allow override with environment variables.
  class << self
    def weather_api_key
      ENV.fetch('API_KEY_WEATHER_API', nil)
    end
  end
end
