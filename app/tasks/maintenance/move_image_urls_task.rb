# frozen_string_literal: true

module Maintenance
  class MoveImageUrlsTask < MaintenanceTasks::Task
    def collection
      Podcast.all
    end

    def process(podcast)
      return if podcast.extras["image_urls"].present?

      images = []

      podcast.image_urls.each do |image|
        images << {url: image.url, height: image.height, width: image.width}
      end

      podcast.extras = {image_urls: images}
      podcast.save!
    end
  end
end
