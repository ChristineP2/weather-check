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

  Weather::FORECAST_TYPES.each do |time|
    #   @method past
    #   @method present
    #   @method future
    #   @method past_cached?
    #   @method present_cached?
    #   @method future_cached?

    instance_variable_set("@#{time}_cached", true)

    define_method time do
      Rails.cache.fetch([zip_code, time], expires_in: 30.minutes) do
        instance_variable_set("@#{time}_cached", false)
        connection.get('forecast.json', send("#{time}_params"))
      end
    end

    define_method("#{time}_cached?".to_sym) do
      if instance_variable_defined?("@#{time}_cached")
        return instance_variable_get("@#{time}_cached")
      end

      Rails.cache.exist?([zip_code, time])
    end
  end

  def future_params
    base_params.merge(
      {
        days: 10
      }
    )
  end

  def past_params
    base_params.merge(
      {
        dt: I18n.l(Date.yesterday.to_date, format: :default)
      }
    )
  end

  def present_params
    base_params
  end

  def base_params
    {
      key: Secrets.weather_api_key,
      q:   zip_code
    }
  end
end
