# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

puts "Starting seeding..."
puts "Rails.env: #{Rails.env}"
exit if Rails.env.production?

puts "Seeding development database..."

# =begin
Podcast.create(
  name: "Remote Ruby",
  description: "Three Rubyists having conversations and interviewing others about Ruby and web development.",
  created_at: "1996-12-25 00:00:00.000000",
  updated_at: "2023-06-07 17:39:10.061216",
  language: "en",
  publisher: "Jason Charnes, Chris Oliver, Andrew Mason",
  external_url: "https://open.spotify.com/show/23ZxPAyiZx2rTJ4NjYycLN",
  )

remote_ruby_podcast = Podcast.find_by(name: "Remote Ruby")

ImageUrl.create(
  url: "https://i.scdn.co/image/bc3b8d03ee5d99733ce866d6be8918adccf94c44",
  podcast_id: remote_ruby_podcast.id,
  created_at: "1996-12-25 00:00:00.000000",
  updated_at: "2023-06-07 18:47:56.709827"
)

ImageUrl.create(
  url: "https://i.scdn.co/image/bc3b8d03ee5d99733ce866d6be8918adccf94c44",
  podcast_id: remote_ruby_podcast.id,
  created_at: "1996-12-25 00:00:00.000000",
  updated_at: "2023-06-07 18:47:56.709827"
)

Category.create(
  name: "Technology",
  created_at: "1996-12-25 00:00:00.000000",
  updated_at: "2023-06-07 18:47:56.709827"
)

remote_ruby_category = Category.find_by(name: "Technology")

Genre.create(
  podcast_id: remote_ruby_podcast.id,
  category_id: remote_ruby_category.id,
  created_at: "1996-12-25 00:00:00.000000",
  updated_at: "2023-06-07 18:47:56.709827"
)
# =end

# Create podcasts
podcasts = FactoryBot.create_list(:podcast, 20)

# Create categories
categories = FactoryBot.create_list(:category, 5)

# For each podcast, create a genre associated with a random category
podcasts.each do |podcast|
  FactoryBot.create(:genre, podcast: podcast, category: categories.sample)
end

# create 2 ImageUrl for each podcasts
podcasts.each do |podcast|
 FactoryBot.create_list(:image_url, 2, podcast: podcast)
end

# Create 2 episodes for each podcast
podcasts.each do |podcast|
  FactoryBot.create_list(:episode, 2, podcast: podcast)
  # Create 2 episode_image_urls for each episode
  podcast.episodes.each do |episode|
    FactoryBot.create_list(:episode_image_url, 2, episode: episode)
  end
end

puts "Completed seeding."
