# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

podcasts = [
  {:uid=>"3lYikBXFrfp3Y7EQlXojrc", :genres=>[]},
  {:uid=>"46rjp3ij3i9UVuPx23r00k", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Marketing", "uri"=>"spotify:genre:0JQ5IMCbQBLjlqsYQ6tkLI"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"7bWiuvqAzKfbBKKqrXAza8", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"08F60fHBihlcqWZTr7Thzc", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Relationships", "uri"=>"spotify:genre:0JQ5DAqbMKFIbOFW5Avg3a"}]},
  {:uid=>"24QifPSob9PbOE5dPwQzXa", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"1tgqafxZAB0Bjd8nkwVtE4", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}]},
  {:uid=>"1oX38e94qRXhEgHh59uWKL", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"498069S6pikjBTLb28G521", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"2nIvarXvvZcp1cePx69x9N", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"2LABkdYFUP7wyZqaszteol", :genres=>[]},
  {:uid=>"3BdVI2jDY4FRY4QKKbY1GM", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"2UpXxWYszkuvZfjyWnPQ4T", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"History", "uri"=>"spotify:genre:0JQ5DAqbMKFKK9EFSCDuOS"}, {"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
  {:uid=>"2YjOMUJ8IUFePkKsUXkQlr", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}]},
  {:uid=>"18xZMSamBXFIkakFP1ZJaA", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Boxing", "uri"=>"spotify:genre:0JQ5IMCbQBLxDG0yEZHJfT"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Basketball", "uri"=>"spotify:genre:0JQ5IMCbQBLyEdGOqIGjLd"}]},
  {:uid=>"34hUmLTuVnUtMAaIldEdtr", :genres=>[]},
  {:uid=>"3cXESA1SHXCi3o3Rz1CMJp", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Books", "uri"=>"spotify:genre:0JQ5DAqbMKFD0Jc9BXRvme"}]},
  {:uid=>"6N38Q3ZgLzTDB8OcAWNdWm", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"4bSTeVDsXWKQCRptxuZnVQ", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}, {"__typename"=>"PodcastTopic", "title"=>"Meditation & Relaxation podcasts", "uri"=>"spotify:genre:meditation_relaxation_podcasts"}]},
  {:uid=>"6UO3XQclSuNnGxB39QdAnL", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"7eGnnZnfb3mOGTqWR4gTjK", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"43Oj7EOZGHmtNQxRoXw8HX", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"7m5EDaIvgtLm9z9mHvy0wX", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}, {"__typename"=>"PodcastTopic", "title"=>"Educational podcasts", "uri"=>"spotify:genre:educational_podcasts"}]},
  {:uid=>"2cKdcxETn7jDp7uJCwqmSE", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"55pPBm0l75K28dIqoHIQIc", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"5ZyWVfBi0WiPlmomrDQ6PM", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"7sGzXXYhRtsTyhGUORo4Ff", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"4PbqD6YLB2hY5pFJWfDgeN", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"6XU1MRwzCfAXD07YHbpjNv", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"2iLvljRGVVIGlJshT5vNDS", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"3QiX0ZkjILyGWmpemackWB", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"4Jgtgr4mHXNDyLldHkfEMz", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"3apZ4F9LH9oI6DIjiQl6zR", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]}
]

podcasts.each do |podcast|
  puts "Creating category #{podcast[:uid]}"
  if podcast[:genres]
    podcast[:genres].each do |genre|
      category = Category.find_or_create_by(name: genre["title"])
    end
  else
    "No genres for #{podcast[:uid]}"
  end
end

podcasts.each do |podcast|
  puts "Creating genres #{podcast[:uid]}"
  if podcast[:genres]
    pp = Podcast.find_by(uid: podcast[:uid])
    if pp
      podcast[:genres].each do |genre|
        category = Category.find_by(name: genre["title"])
        if category
          pp.categories << category
        else
          puts "No category for #{genre["title"]}"
        end
      end
    end
  else
    "No genres for #{podcast[:uid]}"
  end
end
