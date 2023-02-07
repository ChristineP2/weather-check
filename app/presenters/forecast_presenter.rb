# frozen_string_literal: true

class ForecastPresenter < ApplicationPresenter
  include BurnishRails::Presenter.of(
    Forecast
  )
  delegate :rain?, to: :to_model
  delegate :location, to: :to_model
  delegate :snow?, to: :to_model

  def amount_measurement
    return view_context.sanitize('mm') if metric?

    view_context.sanitize('in')
  end

  def avg_temp
    "#{to_model.avg_temp} #{temp_measurement}"
  end

  def date
    I18n.l(to_model.date, format: :long)
  end

  def icon
    view_context.image_tag(
      condition_icon, alt: condition_text
    )
  end

  def max_temp
    "#{to_model.max_temp} #{temp_measurement}"
  end

  def metric?
    location.to_model.metric?
  end

  def min_temp
    "#{to_model.min_temp} #{temp_measurement}"
  end

  def odds_of_rain
    "#{to_model.odds_of_rain}%"
  end

  def odds_of_snow
    "#{to_model.odds_of_snow}%"
  end

  def temp_measurement
    return view_context.sanitize('&deg;C') if metric?

    view_context.sanitize('&deg;F')
  end

  def total_precipitation
    "#{to_model.total_precipitation} #{amount_measurement}"
  end

  def total_snowfall
    "#{to_model.total_snowfall} cm"
  end
end
