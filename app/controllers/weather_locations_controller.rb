# frozen_string_literal: true

# Renders the app.
class WeatherLocationsController < ApplicationController
  def show
    @location = presented_location

    if @location.strong_params.present? && @location.valid?
      @weather = presented_weather
    end

    render('show')
  end

  private

  def presented_location
    WeatherLocationPresenter.new(
      {
        view_context: view_context,
        object: WeatherLocation.new,
        params: params
      }
    ).load_attrs
  end

  def presented_weather
    WeatherAPI.new(@location.zip_code)
  end
end
