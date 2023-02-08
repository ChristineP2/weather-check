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

  Weather::FORECAST_TYPES.each do |time|
    #   @method past
    #   @method present
    #   @method future
    #   @method past_cached?
    #   @method present_cached?
    #   @method future_cached?

    delegate "#{time}_cached?".to_sym, to: :to_model

    define_method(time) do
      if instance_variable_defined?("@#{time}")
        return instance_variable_get("@#{time}")
      end

      instance_variable_set("@#{time}", make_presentable(to_model.send(time)))
    end
  end
end
