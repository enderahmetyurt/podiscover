# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create podcasts
podcasts = FactoryBot.create_list(:podcast, 40)

# Create categories
categories = FactoryBot.create_list(:category, 10)

# For each podcast, create a genre associated with a random category
podcasts.each do |podcast|
  FactoryBot.create(:genre, podcast: podcast, category: categories.sample)
end

puts "Completed seeding."
