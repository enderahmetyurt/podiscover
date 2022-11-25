# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_class?(current_path)
    return 'text-primary bg-secondary px-6 py-4 rounded-lg flex items-center space-x-2' if request.path == current_path

    'px-6 py-4 hover:bg-gray-50 rounded-lg flex items-center space-x-2'
  end
end
