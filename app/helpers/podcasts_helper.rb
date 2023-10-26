# frozen_string_literal: true

module PodcastsHelper
  def first_five_subscribers(subscriptions)
    subscriptions.first(5)
  end
end
