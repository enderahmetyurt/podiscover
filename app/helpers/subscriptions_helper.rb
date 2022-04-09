# frozen_string_literal: true

module SubscriptionsHelper
  def podcast_middle_image_url(subscription)
    subscription.podcast.image_urls.second.url
  end

  def podcast_listeners_count(subscription)
    subscription.podcast.users.count
  end
end
