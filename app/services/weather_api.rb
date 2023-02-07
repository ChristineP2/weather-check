# frozen_string_literal: true

require 'faraday'

class WeatherAPI
  URI = 'http://api.weatherapi.com/v1'
  attr_reader :zip_code, :connection

  def initialize(zip_code, conn = nil)
    @zip_code = zip_code
    @connection = conn || Faraday.new do |c|
      c.url_prefix = WeatherAPI::URI
      c.response(:json, content_type: 'application/json')
      c.adapter(Faraday.default_adapter)
    end
  end

  def current
    @current ||= connection.get('current.json', current_params)
  end

  def present
    @present ||= connection.get('forecast.json', current_params)
  end

  def future
    @future ||= connection.get('forecast.json', future_params)
  end

  def past
    @past ||= connection.get('forecast.json', past_params)
  end

  def future_params
    current_params.merge(
      {
        days: 10
      }
    )
  end

  def past_params
    current_params.merge(
      {
        dt: I18n.l(Date.yesterday.to_date, format: :default)
      }
    )
  end

  def present_params
    current_params.merge(
      {
        dt: I18n.l(Date.current, format: :default)
      }
    )
  end

  def current_params
    {
      key: Secrets.weather_api_key,
      q:   zip_code
    }
  end
end
