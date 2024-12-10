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
