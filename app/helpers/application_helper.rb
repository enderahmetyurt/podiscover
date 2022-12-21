# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_class?(current_path)
    default_classes = 'px-6 py-4 rounded-lg flex items-center space-x-2'
    
    if request.path == current_path
      "text-primary bg-secondary #{default_classes}" 
    else
      "hover:bg-gray-50 #{default_classes}" 
    end
  end

  def pretty_openai_quota
    daily_openai_credit = current_user.daily_openai_credit

    daily_openai_credit.negative? ? 0 : daily_openai_credit
  end
end
