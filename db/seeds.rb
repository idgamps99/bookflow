
Book.destroy_all
User.destroy_all

puts "Seeding books..."

books = [
  {
    title: "1984",
    author: "George Orwell",
    isbn: "0451524934",
    year_published: 1949,
    genre: "Dystopian",
    summary: "A chilling depiction of a totalitarian society controlled by surveillance and propaganda.",
    page_count: 328,
    overall_rating: 4.6
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    isbn: "0679783261",
    year_published: 1813,
    genre: "Romance",
    summary: "A classic tale of love, misunderstandings, and societal expectations.",
    page_count: 279,
    overall_rating: 4.3
  },
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    isbn: "0446310786",
    year_published: 1960,
    genre: "Southern Gothic",
    summary: "A powerful exploration of racial injustice and moral growth in the American South.",
    page_count: 324,
    overall_rating: 4.8
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    isbn: "0743273567",
    year_published: 1925,
    genre: "Tragedy",
    summary: "A story of wealth, love, and the American Dream during the Jazz Age.",
    page_count: 180,
    overall_rating: 4.2
  },
  {
    title: "Moby-Dick",
    author: "Herman Melville",
    isbn: "0142437247",
    year_published: 1851,
    genre: "Adventure",
    summary: "The obsessive quest of Captain Ahab to hunt the white whale, Moby-Dick.",
    page_count: 635,
    overall_rating: 4.1
  },
  {
    title: "War and Peace",
    author: "Leo Tolstoy",
    isbn: "0140447938",
    year_published: 1869,
    genre: "Historical Fiction",
    summary: "A sweeping narrative of Russian society during the Napoleonic Era.",
    page_count: 1225,
    overall_rating: 4.5
  },
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
    isbn: "0316769487",
    year_published: 1951,
    genre: "Coming-of-Age",
    summary: "The experiences and observations of a disenchanted teenage boy in New York City.",
    page_count: 214,
    overall_rating: 4.0
  },
  {
    title: "Brave New World",
    author: "Aldous Huxley",
    isbn: "0060850523",
    year_published: 1932,
    genre: "Dystopian",
    summary: "A satirical look at a futuristic society focused on technological progress and hedonism.",
    page_count: 311,
    overall_rating: 4.4
  },
  {
    title: "Jane Eyre",
    author: "Charlotte Brontë",
    isbn: "0141441143",
    year_published: 1847,
    genre: "Romance",
    summary: "The journey of an orphaned girl as she grows into a strong, independent woman.",
    page_count: 507,
    overall_rating: 4.6
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    isbn: "054792822X",
    year_published: 1937,
    genre: "Fantasy",
    summary: "Bilbo Baggins embarks on a thrilling quest to reclaim a lost dwarf kingdom.",
    page_count: 310,
    overall_rating: 4.8
  },
  {
    title: "Frankenstein",
    author: "Mary Shelley",
    isbn: "0486282112",
    year_published: 1818,
    genre: "Science Fiction",
    summary: "Victor Frankenstein creates a monster that wreaks havoc on his life.",
    page_count: 280,
    overall_rating: 4.2
  },
  {
    title: "Crime and Punishment",
    author: "Fyodor Dostoevsky",
    isbn: "0143058142",
    year_published: 1866,
    genre: "Crime",
    summary: "A young man's moral struggles after committing a crime lead to deep introspection.",
    page_count: 671,
    overall_rating: 4.5
  },
  {
    title: "Wuthering Heights",
    author: "Emily Brontë",
    isbn: "0141439556",
    year_published: 1847,
    genre: "Gothic Fiction",
    summary: "A haunting tale of love, revenge, and the destructive power of passion.",
    page_count: 416,
    overall_rating: 4.3
  },
  {
    title: "The Odyssey",
    author: "Homer",
    isbn: "0140268863",
    year_published: -700,
    genre: "Epic Poetry",
    summary: "The epic journey of Odysseus as he attempts to return home after the Trojan War.",
    page_count: 541,
    overall_rating: 4.7
  },
  {
    title: "Fahrenheit 451",
    author: "Ray Bradbury",
    isbn: "1451673310",
    year_published: 1953,
    genre: "Dystopian",
    summary: "A tale of a society where books are outlawed and 'firemen' burn them.",
    page_count: 256,
    overall_rating: 4.4
  }
]


books.each do |book|
  # Generate the cover image URL
  cover_url = "https://covers.openlibrary.org/b/isbn/#{book[:isbn]}-L.jpg"

  # Create the book record, storing the cover URL in a column
  Book.create!(
    title: book[:title],
    author: book[:author],
    cover_url: cover_url,
    year_published: book[:year_published],
    genre: book[:genre],
    summary: book[:summary],
    page_count: book[:page_count],
    overall_rating: book[:overall_rating]
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
    password: 'password',
    password_confirmation: 'password'
  )
end

puts "Seeding complete! #{User.count} users created."
