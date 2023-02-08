# frozen_string_literal: true

class Weather < ApplicationModel
  attribute :past, Forecast
  attribute :present, Forecast
  attribute :future, Forecast

  FORECAST_TYPES = %i[past present future].freeze
  FORECAST_KEYS = %w[date day].freeze
  attr_accessor :location
  attr_reader :api

  def initialize(*args)
    super(*args)
    @location = location
    @api = WeatherAPI.new(location.zip_code) if location
  end

  FORECAST_TYPES.each do |time|
    #   @method past_cached?
    #   @method present_cached?
    #   @method future_cached?
    #   @method past_forecast
    #   @method present_forecast
    #   @method future_forecast
    #   @method past
    #   @method present
    #   @method future

    forecast_method_name = "#{time}_forecast".to_sym

    delegate "#{time}_cached?".to_sym, to: :@api

    define_method time do
      # Use Date and Day data to hydrate Forecast for use in a presenter
      day_and_dates_for(send(forecast_method_name))
        .each_with_object([]) do |hsh, arr|
        arr << Forecast.new({ data: hsh, location: location })
      end
    end

    define_method forecast_method_name do
      body = api.send(time).body

      body = JSON.parse(body) if body.is_a?(String)

      body['forecast']['forecastday']
    end
  end

  private

  def day_and_dates_for(forecasts)
    forecasts.map do |day|
      day.select do |key, _value|
        FORECAST_KEYS.include?(key)
      end
    end
  end
end
