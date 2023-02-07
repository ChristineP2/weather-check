# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherAPI do
  subject(:weather_api) { described_class.new(zip_code, conn) }

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:conn) { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:zip_code) { '94041' }

  after do
    Faraday.default_connection = nil
  end

  describe '#initialize' do
    it 'assigns zip_code' do
      expect(weather_api.zip_code).to eq(zip_code)
    end
  end

  describe '#present_params' do
    it_behaves_like 'a WeatherAPI Call regarding the', 'present'
  end

  describe '#future_params' do
    it_behaves_like 'a WeatherAPI Call regarding the', 'future'

    it 'requests the next 10 days' do
      expect(weather_api.future_params[:days]).to eq(10)
    end
  end

  describe '#past_params' do
    it_behaves_like 'a WeatherAPI Call regarding the', 'past'

    it 'has dt in the params' do
      expect(weather_api.past_params).to have_key(:dt)
    end
  end
end
