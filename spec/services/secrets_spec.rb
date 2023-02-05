# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Secrets do
  describe '.weather_api_key' do
    context 'when API_KEY_WEATHER_API is set' do
      before do
        ENV['API_KEY_WEATHER_API'] = 'api_key'
      end

      after do
        ENV['API_KEY_WEATHER_API'] = nil
      end

      it 'returns the value of API_KEY_WEATHER_API' do
        expect(described_class.weather_api_key).to eq('api_key')
      end
    end

    context 'when API_KEY_WEATHER_API is not set' do
      it 'returns nil' do
        expect(described_class.weather_api_key).to be_nil
      end
    end
  end
end
