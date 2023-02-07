# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to allow_value('12345').for(:zip_code) }
    it { is_expected.to validate_presence_of(:address) }

    context 'when ZIP code is valid' do
      subject { build(:location, zip_code: '90210') }

      it { is_expected.to be_valid }
    end

    context 'when ZIP code is invalid' do
      subject { build(:location, zip_code: '90210B') }

      it { is_expected.to be_invalid }
    end
  end

  describe '#city' do
    it 'returns city from details' do
      location = build(:location, zip_code: '90210')
      expect(location.city).to eq('Beverly Hills')
    end
  end

  describe '#country_alpha2' do
    it 'returns US' do
      location = build(:location)
      expect(location.country_alpha2).to eq('US')
    end
  end

  describe '#state_name' do
    it 'returns state_name from details' do
      location = build(:location, zip_code: '90210')
      expect(location.state_name).to eq('California')
    end
  end

  describe '#state_code' do
    it 'returns state_code from details' do
      location = build(:location, zip_code: '90210')
      expect(location.state_code).to eq('CA')
    end
  end

  describe '#time_zone' do
    it 'returns time_zone from details' do
      location = build(:location, zip_code: '90210')
      expect(location.time_zone).to eq('America/Los_Angeles')
    end
  end
end
