# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# puts "Clearing database..."
# Book.destroy_all
# puts "Database cleared!"

puts "Starting seeds..."
15.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    summary: Faker::Lorem.sentence,
    page_count: rand(120..600),
    overall_rating: rand(0..5)
  )
end
puts "Database seeded!"
