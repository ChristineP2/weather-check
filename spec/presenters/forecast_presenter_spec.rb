# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ForecastPresenter do
  include ActionView::TestCase::Behavior
  subject(:presenter) do
    described_class.new(
      {
        view_context: view,
        object:       Forecast.new(
          {
            data:     mock_forecast_response['forecast']['forecastday'][0],
            location: instance_double(
              LocationPresenter,
              {
                metric?:  false,
                to_model: instance_double(Location,
                                          metric?: false)
              }
            )
          }
        )
      }
    )
  end

  it { is_expected.to delegate_method(:location).to(:to_model) }
  it { is_expected.to delegate_method(:rain?).to(:to_model) }
  it { is_expected.to delegate_method(:snow?).to(:to_model) }

  describe '#amount_measurement' do
    context 'when not metric?' do
      it 'returns an imperial unit of measurement' do
        expect(presenter.amount_measurement).to eq('in')
      end
    end
  end

  describe '#avg_temp' do
    it 'returns a string of the average temperature' do
      expect(presenter.avg_temp).to eq('53.6 °F')
    end
  end

  describe '#date' do
    it 'returns the long form of the date' do
      expect(presenter.date).to eq('February 07, 2023')
    end
  end

  describe '#icon' do
    it 'returns an image tag with src' do
      expect(presenter.icon).to include(
        'src="//cdn.weatherapi.com/weather/64x64/day/113.png"'
      )
    end

    it 'returns an image tag with alt' do
      expect(presenter.icon).to include('alt="Sunny"')
    end
  end

  describe '#max_temp' do
    it 'returns a string of the maximum temperature' do
      expect(presenter.max_temp).to eq('59.0 °F')
    end
  end

  describe '#min_temp' do
    it 'returns the min_temp with the temp_measurement' do
      expect(presenter.min_temp).to eq('48.2 °F')
    end
  end

  describe '#odds_of_rain' do
    it 'returns the odds of rain as a percentage' do
      expect(presenter.odds_of_rain).to eq('10%')
    end
  end

  describe '#odds_of_snow' do
    it 'returns the odds of snow as a percentage' do
      expect(presenter.odds_of_snow).to eq('0%')
    end
  end

  describe '#temp_measurement' do
    context 'when not metric?' do
      it 'returns an imperial unit of measurement' do
        expect(presenter.temp_measurement).to eq('°F')
      end
    end
  end

  describe '#total_precipitation' do
    it 'returns the total precipitation with the proper measurement' do
      expect(presenter.total_precipitation).to eq('0.2 in')
    end
  end

  describe '#total_snowfall' do
    it 'returns the total snowfall with the proper measurement' do
      expect(presenter.total_snowfall).to eq('10.0 cm')
    end
  end
end
