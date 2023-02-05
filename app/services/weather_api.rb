# frozen_string_literal: true

require 'faraday'

class WeatherAPI
  attr_reader :zip_code

  URI = 'http://api.weatherapi.com/v1'

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def connection
    @connection ||= Faraday.new do |conn|
      conn.url_prefix = WeatherAPI::URI
      conn.response(:json, content_type: 'application/json')
      conn.adapter(Faraday.default_adapter)
    end
  end

  def current
    @current ||= connection.get('current.json', present_params)
  end

  def future
    @future ||= connection.get('forecast.json', future_params)
  end

  def past
    @past ||= connection.get('history.json', past_params)
  end

  def future_params
    present_params.merge(
      {
        dt: I18n.l(10.days.from_now.to_date,
                   format: :default)
      }
    )
  end

  def past_params
    present_params.merge(
      {
        dt: I18n.l(7.days.ago.to_date, format: :default)
      }
    )
  end

  def present_params
    {
      key: Secrets.weather_api_key,
      q: zip_code
    }
  end
end
