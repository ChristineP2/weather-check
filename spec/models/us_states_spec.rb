# frozen_string_literal: true

require 'rails_helper'

RSpec.describe USStates do
  describe '.includes?' do
    context 'when state exists as a key' do
      it 'returns true' do
        expect(described_class).to be_includes(:AL)
      end
    end

    context 'when state exists as a value' do
      it 'returns true' do
        expect(described_class).to be_includes('Alabama')
      end
    end

    context 'when state does not exist' do
      it 'returns false' do
        expect(described_class).not_to be_includes(:XX)
      end
    end
  end
end
