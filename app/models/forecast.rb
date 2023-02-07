# frozen_string_literal: true

class Forecast < ApplicationModel
  attribute :avg_temp, :string
  attribute :min_temp, :string
  attribute :max_temp, :string
  attribute :condition_code, :string
  attribute :condition_icon, :string
  attribute :condition_text, :string
  attribute :date, :date
  attribute :odds_of_rain, :integer
  attribute :odds_of_snow, :integer
  attribute :rain?, :boolean
  attribute :snow?, :boolean
  attribute :total_precipitation, :string
  attribute :total_snowfall, :string

  attr_accessor :data, :location

  attr_reader :api

  delegate :metric?, to: :location

  def to_s
    "#{condition_text}, Average Temperature #{avg_temp}"
  end

  def avg_temp
    return forecast_detail['avgtemp_c'] if metric?

    forecast_detail['avgtemp_f']
  end

  def condition_code
    condition['code']
  end

  def condition_icon
    condition['icon']
  end

  def condition_text
    condition['text']
  end

  def date
    Date.strptime(data['date'], '%Y-%m-%d')
  end

  def max_temp
    return forecast_detail['maxtemp_c'] if metric?

    forecast_detail['maxtemp_f']
  end

  def min_temp
    return forecast_detail['mintemp_c'] if metric?

    forecast_detail['mintemp_f']
  end

  def odds_of_rain
    forecast_detail['daily_chance_of_rain']
  end

  def odds_of_snow
    forecast_detail['daily_chance_of_snow']
  end

  def rain?
    ActiveModel::Type::Boolean.new.cast(forecast_detail['daily_will_it_rain'])
  end

  def snow?
    ActiveModel::Type::Boolean.new.cast(forecast_detail['daily_will_it_snow'])
  end

  def total_precipitation
    return forecast_detail['totalprecip_mm'] if metric?

    forecast_detail['totalprecip_in']
  end

  def total_snowfall
    # They don't offer inches, so everyone gets cm
    forecast_detail['totalsnow_cm']
  end

  private

  def condition
    forecast_detail['condition']
  end

  def forecast_detail
    data['day']
  end
end
