# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning, :success

  around_action :set_time_zone, if: @location

  def set_time_zone(&)
    time_zone = @location.try(:time_zone) || 'UTC'
    Time.use_zone(time_zone, &)
  end
end
