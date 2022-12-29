# frozen_string_literal: true
require 'rest-client'
require 'json'

class DiscoversController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def advice
    @prompt = params[:prompt]
    if valid_prompt?
      if current_user.can_openai?
        @result = OpenaiService.call(current_user, @prompt)
      else
        @result = t("openai.results.quota_problem")
      end
    else
      flash[:warn] = "Please check your question."
      redirect_to discovers_path
    end
  end

  def all_responses
    @requests_responses = current_user.openai_requests.order(created_at: :desc)
  end

  private

  def valid_prompt?
    @prompt.size > 0 && @prompt.size < 140
  end
end
