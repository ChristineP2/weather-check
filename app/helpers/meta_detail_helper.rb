# frozen_string_literal: true

# Helpers for basic application page/site information
module MetaDetailHelper
  include AbstractController::Translation

    def app_title
       "Weather Check"
    end


  def plain_title
    [base_title, app_title].compact.join(' ~ ')
  end

  def content_title
    return base_title if base_title.present?

    action_name.humanize
  end

  def base_title
    return custom_title if custom_title.present?

    return nil if translated_title.blank?

    translated_title
  end

  def translated_title
    t('.title', default: '')
  end

  def content_detail
    return custom_detail if custom_detail.present?

    t('.detail', default: '')
  end

  def custom_title
    @custom_title ||= content_for(:custom_title)
  end

  def custom_detail
    @custom_detail ||= content_for(:custom_detail)
  end
end
