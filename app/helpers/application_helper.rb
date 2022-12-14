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
end
