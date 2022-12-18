# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_class?(current_path)
    return 'text-red-600' if request.path == current_path

    ''
  end

  def pretty_openai_quota
    daily_openai_credit = current_user.daily_openai_credit

    daily_openai_credit.negative? ? 0 : daily_openai_credit
  end
end
