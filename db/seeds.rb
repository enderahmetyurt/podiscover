# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

podcasts = [{:uid=>"63zeZeyHMgERmbwhDhIrD1", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"4aavXzJwwW4Yy43lAlfjLf", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"5ixqcoDt93GVu6tr6eaiuh", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"0ouPKjo1tKkj8V4nNI7mBv", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"64cCsH4LCyO5U52xUU4Pax", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"2YLFthx5PP55WTazamT0zn", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"31NmrC2kMHlzrORqqOWAF3", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"5phxjbOeUgwqkWfirBFmgJ", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"7hgnfI4D2P5baN9CZxrIw1", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]},
{:uid=>"5kRel8SUkrQyFX25anyPWi", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}]}]

# Creating categories

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

# Connecting podcasts to categories

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
