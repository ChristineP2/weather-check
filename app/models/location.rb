# frozen_string_literal: true

class Location < ApplicationModel
  attribute :address, :string
  attribute :city, :string
  attribute :country_alpha2, :string
  attribute :state_code, :string
  attribute :state_name, :string
  attribute :time_zone, :string
  attribute :zip_code, :string
  attribute :lat, :float
  attribute :lon, :float
  attribute :local_time, :datetime
  attribute :metric?, :boolean

  attr_accessor :address, :zip_code, :lat, :lon

  validates :address, presence: true
  validates :zip_code, presence: true, zipcode: true
  validate :nation_check

  def to_s
    "#{city}, #{state_name}"
  end

  def city
    details[:city]
  end

  def country_alpha2
    'US'
  end

  def state_name
    details[:state_name]
  end

  def state_code
    details[:state_code]
  end

  def time_zone
    details[:time_zone]
  end

  def details
    return blank_zip_details if zip_details.blank?

    zip_details
  end

  def metric?
    return false if country_alpha2 == 'US'

    true
  end

  private

  def zip_details
    @zip_details ||= ZipCodes.identify(zip_code)
  end

  def blank_zip_details
    {
      state_code: nil,
      state_name: nil,
      city:       nil,
      time_zone:  nil
    }
  end

  def nation_check
    return if USStates.includes?(state_code)

    errors.add(:zip_code, Location.human_error(:not_in_us))
  end
end
