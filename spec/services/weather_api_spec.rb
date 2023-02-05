# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherAPI do
  subject(:weather_api) { described_class.new(zip_code) }

  let(:zip_code) { '94041' }

  describe '#initialize' do
    it 'assigns zip_code' do
      expect(weather_api.zip_code).to eq(zip_code)
    end
  end

  describe '#connection' do
    it 'creates a Faraday connection' do
      expect(weather_api.connection).to be_a(Faraday::Connection)
    end
  end

  describe '#present_params' do
    it_behaves_like 'a WeatherAPI Call regarding the', 'present'
  end

  describe '#future_params' do
    it_behaves_like 'a WeatherAPI Call regarding the', 'future'
    it_behaves_like 'a dated WeatherAPI Call', 'future'
  end

  describe '#historical_params' do
    it_behaves_like 'a WeatherAPI Call regarding the', 'past'
    it_behaves_like 'a dated WeatherAPI Call', 'past'
  end
end
