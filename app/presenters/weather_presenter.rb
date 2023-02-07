# frozen_string_literal: true

class WeatherPresenter < ApplicationPresenter
  include BurnishRails::Presenter.of(
    Weather,
    {
      keys: {
        show: Weather::FORECAST_TYPES
      }
    }
  )
  include BurnishRails::Serializer.of(
    ForecastPresenter
  )

  def forecasts(time)
    send(time.to_sym)
  end

  def forecast_column_class(time)
    'column is-half' if forecasts(time).count > 1
  end

  def forecast_presentation_class(time)
    'columns is-multiline' if forecasts(time).count > 1
  end

  def past
    @past ||= make_presentable(to_model.past)
  end

  def present
    @present ||= make_presentable(to_model.present)
  end

  def future
    @future ||= make_presentable(to_model.future)
  end
end
