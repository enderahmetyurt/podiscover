module Host
  module EpisodeHelper
    def sort_link(column:, label:)
      if column == params[:column]
        link_to(label, host_podcast_episodes_path(column: column, direction: next_direction))
      else
        link_to(label, host_podcast_episodes_path(column: column, direction: "asc"))
      end
    end

    def next_direction
      (params[:direction] == "asc") ? "desc" : "asc"
    end
  end
end
