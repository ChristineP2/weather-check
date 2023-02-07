# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationPresenter, type: :presenter do
  include ActionView::TestCase::Behavior

  subject(:location_presenter) do
    described_class.new(
      {
        view_context: view,
        object:       location
      }
    )
  end

  let(:location) { build(:location) }

  describe '#to_model' do
    it { is_expected.to delegate_method(:metric?).to(:to_model) }
  end

  describe '.form_field_options' do
    it 'returns a hash of form field options' do
      expect(described_class.form_field_options).to eq(
        {
          address:  { as: :string },
          zip_code: { as: :string }
        }
      )
    end
  end

  describe 'to_s' do
    it { expect(location_presenter.to_s).not_to be_empty }
  end

  describe 'keys' do
    context 'when showing' do
      it do
        expect(described_class.show_keys).to eq(
          %i[address city state_name zip_code]
        )
      end
    end

    context 'when modifying' do
      it { expect(described_class.modify_keys).to eq(%i[address zip_code]) }
    end
  end
end
