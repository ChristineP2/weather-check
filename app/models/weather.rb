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
    #   @method past
    #   @method present
    #   @method future
    define_method time do
      if instance_variable_defined?("@#{time}")
        return instance_variable_get("@#{time}")
      end

      # Use Date and Day data to hydrate Forecast for use in a presenter
      forecast_array = day_and_dates_for(specific_forecast(time))
        .each_with_object([]) do |hsh, arr|
        arr << Forecast.new({ data: hsh, location: location })
      end

      instance_variable_set("@#{time}", forecast_array)
    end
  end

  private

  def specific_forecast(time)
    body = api.send(time).body

    body = JSON.parse(body) if body.is_a?(String)

    body['forecast']['forecastday']
  end

  def day_and_dates_for(forecasts)
    forecasts.map do |day|
      day.select do |key, _value|
        FORECAST_KEYS.include?(key)
      end
    end
  end
end
