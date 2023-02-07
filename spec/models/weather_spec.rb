# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather do
  let(:location) { instance_double(Location, zip_code: '90210') }
  let(:weather) { described_class.new(location: location) }

  before do
    # stub the API call to return the mock response

    # rubocop:disable RSpec/VerifiedDoubles
    allow(WeatherAPI).to receive(:new).and_return(
      double(
        :api,
        past:    double(:past_response, body: mock_forecast_response),
        present: double(:present_response, body: mock_forecast_response),
        future:  double(:future_response, body: mock_forecast_response)
      )
    )
    # rubocop:enable RSpec/VerifiedDoubles
  end

  describe 'attributes' do
    it { is_expected.to respond_to(:past) }
    it { is_expected.to respond_to(:present) }
    it { is_expected.to respond_to(:future) }
    it { is_expected.to respond_to(:location) }
    it { is_expected.to respond_to(:api) }
  end

  describe '#past' do
    it 'returns an array' do
      expect(weather.past).to be_an_instance_of(Array)
    end

    it 'returns Forecast Objects' do
      expect(weather.past.first).to be_an_instance_of(Forecast)
    end
  end

  describe '#present' do
    it 'returns an array' do
      expect(weather.present).to be_an_instance_of(Array)
    end

    it 'returns Forecast objects' do
      expect(weather.present.first).to be_an_instance_of(Forecast)
    end
  end

  describe '#future' do
    it 'returns an array' do
      expect(weather.future).to be_an_instance_of(Array)
    end

    it 'returns Forecast objects' do
      expect(weather.future.first).to be_an_instance_of(Forecast)
    end
  end
end
