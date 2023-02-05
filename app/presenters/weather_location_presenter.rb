# frozen_string_literal: true

class WeatherLocationPresenter < ApplicationPresenter
  include BurnishRails::Presenter.of(
    'weather_location',
    'wl',
    WeatherLocation,
    {
      keys: {
        show: %i[address city state_name zip_code],
        modify: %i[address zip_code]
      }
    }
  )

  class << self
    def form_field_options
      {
        address: { as: :string },
        zip_code: { as: :string }
      }
    end
  end
end
