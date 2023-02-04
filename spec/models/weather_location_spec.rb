# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherLocation do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to allow_value('12345').for(:zip_code) }
    it { is_expected.to validate_presence_of(:address) }

    context 'when ZIP code is valid' do
      subject { build(:weather_location, zip_code: '90210') }

      it { is_expected.to be_valid }
    end

    context 'when ZIP code is invalid' do
      subject { build(:weather_location, zip_code: '90210B') }

      it { is_expected.to be_invalid }
    end
  end

  describe '#city' do
    it 'returns city from details' do
      weather_location = build(:weather_location, zip_code: '90210')
      expect(weather_location.city).to eq('Beverly Hills')
    end
  end

  describe '#country_alpha2' do
    it 'returns US' do
      weather_location = build(:weather_location)
      expect(weather_location.country_alpha2).to eq('US')
    end
  end

  describe '#state_name' do
    it 'returns state_name from details' do
      weather_location = build(:weather_location, zip_code: '90210')
      expect(weather_location.state_name).to eq('California')
    end
  end

  describe '#state_code' do
    it 'returns state_code from details' do
      weather_location = build(:weather_location, zip_code: '90210')
      expect(weather_location.state_code).to eq('CA')
    end
  end

  describe '#time_zone' do
    it 'returns time_zone from details' do
      weather_location = build(:weather_location, zip_code: '90210')
      expect(weather_location.time_zone).to eq('America/Los_Angeles')
    end
  end
end
