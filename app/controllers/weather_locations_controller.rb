# frozen_string_literal: true

# Renders the app.
class WeatherLocationsController < ApplicationController
  def show
    @location = WeatherLocationPresenter.new({
                                               view_context:,
                                               object: WeatherLocation.new,
                                               params:
                                             }).load_attrs

    @location.valid? if @location.strong_params.present?

    render('show')
  end
end
