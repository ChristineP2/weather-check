# frozen_string_literal: true

require 'rails_helper'

# Rails Console:
#
# require 'factory_bot_rails';
# reload!;FactoryBot.factories.clear; FactoryBot.find_definitions

RSpec.describe(FactoryBot) do
  it 'is linted' do
    expect(described_class.lint(traits: true, verbose: true)).to be_nil
  end
end
