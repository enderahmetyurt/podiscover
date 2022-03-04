# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_class?(current_path)
    return 'text-red-600' if request.path == current_path
    ''
  end  
end
