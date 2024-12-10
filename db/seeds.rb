Book.destroy_all
User.destroy_all

puts "Seeding books..."

15.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    year_published: rand(1900..2023),
    genre: Faker::Book.genre,
    summary: Faker::Lorem.sentence,
    page_count: rand(120..600),
    overall_rating: rand(0..5)
  )
end

puts "Seeding complete! #{Book.count} books created."
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
