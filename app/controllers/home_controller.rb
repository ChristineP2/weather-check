# frozen_string_literal: true

# Renders the app.
class HomeController < ApplicationController
  def show
    present_location
    present_weather

    render('show')
  end

  private

  def present_location
    @location = LocationPresenter.new(
      {
        view_context: view_context,
        object:       Location.new,
        params:       params
      }
    ).load_attrs
  end

  def present_weather
    return unless @location.strong_params.present? && @location.valid?

    @api = Weather.new({ location: @location })
    @weather = WeatherPresenter.new(
      {
        view_context: view_context,
        object:       @api
      }
    )
  end
end
