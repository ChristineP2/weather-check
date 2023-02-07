# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Forecast do
  let(:location) { instance_double(Location, metric?: false) }
  let(:forecast_specific) do
    mock_forecast_response['forecast']['forecastday'][0]
  end
  let(:forecast) do
    described_class.new(
      {
        data:     forecast_specific,
        location: location
      }
    )
  end

  describe '#condition_code' do
    it 'returns the condition code' do
      expect(forecast.condition_code).to eq 1000
    end
  end

  describe '#condition_icon' do
    it 'returns the condition icon' do
      expect(forecast.condition_icon).to eq(
        '//cdn.weatherapi.com/weather/64x64/day/113.png'
      )
    end
  end

  describe '#condition_text' do
    it 'returns the condition text' do
      expect(forecast.condition_text).to eq 'Sunny'
    end
  end

  describe '#date' do
    it 'returns the date as a Date object' do
      expect(forecast.date).to eq Date.new(2023, 2, 7)
    end
  end

  describe '#odds_of_rain' do
    it 'returns the odds_of_rain' do
      expect(forecast.odds_of_rain).to eq('10')
    end
  end

  describe '#odds_of_snow' do
    it 'returns the odds_of_snow' do
      expect(forecast.odds_of_snow).to eq('0')
    end
  end

  describe '#rain?' do
    it 'returns if it will rain' do
      expect(forecast.rain?).to be false
    end
  end

  describe '#snow?' do
    it 'returns if it will snow' do
      expect(forecast.snow?).to be false
    end
  end

  describe 'Imperial Values' do
    describe '#avg_temp' do
      it 'returns the avgtemp_f when location is not metric' do
        expect(forecast.avg_temp).to eq 53.6
      end
    end

    describe '#max_temp' do
      it 'returns the maxtemp_f when location is not metric' do
        expect(forecast.max_temp).to eq 59
      end
    end

    describe '#min_temp' do
      it 'returns the mintemp_f when location is not metric' do
        expect(forecast.min_temp).to eq 48.2
      end
    end

    describe '#total_precipitation' do
      it 'returns the totalprecip_in when location is not metric' do
        expect(forecast.total_precipitation).to eq 0.2
      end
    end

    describe '#total_snowfall' do
      it 'returns the totalsnow_cm when location is not metric' do
        expect(forecast.total_snowfall).to eq 10.0
      end
    end
  end

  describe 'Metric Values' do
    before do
      allow(location).to receive(:metric?).and_return(true)
    end

    describe '#avg_temp' do
      it 'returns the avgtemp_c when location is metric' do
        allow(location).to receive(:metric?).and_return(true)
        expect(forecast.avg_temp).to eq 12
      end
    end

    describe '#max_temp' do
      it 'returns the maxtemp_c when location is metric' do
        expect(forecast.max_temp).to eq 15
      end
    end

    describe '#min_temp' do
      it 'returns the mintemp_c when location is metric' do
        expect(forecast.min_temp).to eq 9
      end
    end

    describe '#total_precipitation' do
      it 'returns the totalprecip_mm when location is metric' do
        expect(forecast.total_precipitation).to eq 10
      end
    end

    describe '#total_snowfall' do
      it 'returns the totalsnow_cm when location is metric' do
        expect(forecast.total_snowfall).to eq 10
      end
    end
  end
end
