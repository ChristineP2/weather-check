# frozen_string_literal: true

class LocationPresenter < ApplicationPresenter
  include BurnishRails::Presenter.of(
    Location,
    {
      keys: {
        show:   %i[address city state_name zip_code],
        modify: %i[address zip_code]
      }
    }
  )

  class << self
    def form_field_options
      {
        address:  { as: :string },
        zip_code: { as: :string }
      }
    end
  end

  delegate :metric?, to: :to_model

  def to_s
    view_context.sanitize(
      view_context.content_tag(:p) do
        str = "#{address}, "
        str += "#{city}, " if city.present?
        str += "#{state_code} " if state_code.present?
        str + zip_code.to_s
      end
    )
  end
end
