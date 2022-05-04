# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @category = Category.find(params[:id])
    @podcasts = @category.podcasts
  end
end
