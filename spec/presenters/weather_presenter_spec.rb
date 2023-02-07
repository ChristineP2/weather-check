# frozen_string_literal: true

require 'rails_helper'

# spec/models/weather_spec.rb

RSpec.describe WeatherPresenter, type: :presenter do
  include ActionView::TestCase::Behavior

  subject(:presenter) do
    described_class.new(
      {
        view_context: view,
        object:       instance_double(Weather)
      }
    )
  end

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:conn) { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:zip_code) { '94041' }

  describe '#past' do
    before do
      allow(presenter.to_model).to receive(:past).and_return(
        stubs.get('forecast.json') do
          mock_api_response
        end
      )
    end

    it 'returns an array' do
      expect(presenter.past).to be_an_instance_of(Array)
    end

    it 'results are ForecastPresenters' do
      expect(presenter.past).to all(be_a(ForecastPresenter))
    end
  end

  describe '#present' do
    before do
      allow(presenter.to_model).to receive(:present).and_return(
        stubs.get('forecast.json') do
          mock_api_response
        end
      )
    end

    it 'returns an array' do
      expect(presenter.present).to be_an_instance_of(Array)
    end

    it 'results are ForecastPresenters' do
      expect(presenter.present).to all(be_a(ForecastPresenter))
    end
  end

  describe '#future' do
    before do
      allow(presenter.to_model).to receive(:future).and_return(
        stubs.get('forecast.json') do
          mock_api_response
        end
      )
    end

    it 'returns an array' do
      expect(presenter.future).to be_an_instance_of(Array)
    end

    it 'results are ForecastPresenters' do
      expect(presenter.future).to all(be_a(ForecastPresenter))
    end
  end
end
