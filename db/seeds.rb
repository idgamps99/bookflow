# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Book.destroy_all

puts "Seeding books..."

15.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    year_published: rand(1900..2023),
    genre: Faker::Book.genre,
    page_count: rand(100..1000),
    overall_rating: rand(1..10),
    summary: Faker::Lorem.paragraph(sentence_count: 5)
  )
end

puts "Seeding complete! #{Book.count} books created."


User.destroy_all

puts "Seeding users..."

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.unique.username(specifier: 5..8),
    email: Faker::Internet.unique.email,
    password: 'password123',
    password_confirmation: 'password123'
  )
end

puts "Seeding complete! #{User.count} users created."
