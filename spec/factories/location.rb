# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }

    skip_create # ActiveModel doesn't write to db
    initialize_with { new(attributes) }
  end
end
