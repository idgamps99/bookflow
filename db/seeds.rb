# User.destroy_all
# Destroy all your books in the database in the console first pls or errors will occur
# This seed makes 100 API calls and we have a max 10,000 per day so don't destroy_all and reseed over and over again pls 'n thnx
# If it fails at some point (it will) don't worry, it'll still have seeded some of them
# You can manually seed by clicking on results in the index page
# ^^^ each time you go to show page it will create a new instance of book, unless it exists already in the DB

# puts "Destroying all previous records..."
# ReadingSession.destroy_all
# Tracker.destroy_all
# Review.destroy_all
# ReadingList.destroy_all
# Book.destroy_all
# User.destroy_all

# puts "destroyed all previous records"

# # Seed books from Google Books API
# # Top 100ish books
# books = [
#   #    ["To Kill a Mockingbird", 4.8, "Fiction"],
#   ["1984", 4.7, "Dystopian"],
#   ["Pride and Prejudice", 4.6, "Romance"],
#   ["The Great Gatsby", 4.5, "Classic"],
#   ["Moby Dick", 4.2, "Adventure"],
#   ["War and Peace", 4.4, "Historical"],
#   ["The Catcher in the Rye", 4.3, "Fiction"],
#   ["The Hobbit", 4.9, "Fantasy"],
#   ["Crime and Punishment", 4.5, "Philosophical"],
#   ["Jane Eyre", 4.6, "Romance"],
#   ["Brave New World", 4.4, "Dystopian"],
#   ["Wuthering Heights", 4.2, "Romance"],
#   #   ["Les Misérables", 4.8, "Historical"],
#   ["Fahrenheit 451", 4.6, "Dystopian"],
#   ["The Alchemist", 4.5, "Philosophical"],
#   ["The Lord of the Rings", 5.0, "Fantasy"],
#   ["The Little Prince", 4.7, "Fable"],
#   ["The Road", 4.4, "Post-Apocalyptic"],
#   ["Dune", 4.8, "Science Fiction"],
#   ["Slaughterhouse-Five", 4.3, "Science Fiction"],
#   ["Dracula", 4.5, "Horror"],
#   ["The Kite Runner", 4.7, "Fiction"],
#   ["Of Mice and Men", 4.6, "Fiction"],
#   ["Frankenstein", 4.5, "Horror"],
#   ["The Handmaid's Tale", 4.6, "Dystopian"],
#   ["The Book Thief", 4.8, "Historical"],
#   ["A Tale of Two Cities", 4.4, "Historical"],
#   ["Catch-22", 4.5, "Satire"],
#   ["The Grapes of Wrath", 4.3, "Fiction"],
#   ["Don Quixote", 4.6, "Adventure"],
#   ["Beloved", 4.5, "Fiction"],
#   ["The Shining", 4.4, "Horror"],
#   ["The Picture of Dorian Gray", 4.7, "Philosophical"],
#   ["Memoirs of a Geisha", 4.6, "Historical"],
#   ["Lolita", 4.3, "Classic"],
#   ["The Count of Monte Cristo", 4.9, "Adventure"],
#   ["The Stranger", 4.2, "Philosophical"],
#   ["The Name of the Rose", 4.4, "Mystery"],
#   ["Rebecca", 4.5, "Mystery"],
#   ["A Clockwork Orange", 4.2, "Dystopian"],
#   ["The Color Purple", 4.7, "Fiction"],
#   ["The Secret Garden", 4.6, "Children's"],
#   ["Life of Pi", 4.4, "Adventure"],
#   ["The Hitchhiker's Guide to the Galaxy", 4.8, "Science Fiction"],
#   ["Middlemarch", 4.5, "Classic"],
#   ["Gulliver's Travels", 4.3, "Satire"],
#   ["Persuasion", 4.4, "Romance"],
#   ["Emma", 4.3, "Romance"],
#   ["Great Expectations", 4.5, "Classic"],
#   ["A Farewell to Arms", 4.2, "Romance"],
#   ["The Bell Jar", 4.6, "Fiction"],
#   ["One Hundred Years of Solitude", 4.8, "Magical Realism"],
#   ["Invisible Man", 4.5, "Fiction"],
#   ["Things Fall Apart", 4.4, "Historical"],
#   ["Atlas Shrugged", 4.2, "Philosophical"],
#   ["The Fountainhead", 4.3, "Philosophical"],
#   ["The Shadow of the Wind", 4.7, "Mystery"],
#   ["The Night Circus", 4.6, "Fantasy"],
#   ["Norwegian Wood", 4.4, "Fiction"],
#   ["The Wind-Up Bird Chronicle", 4.3, "Fiction"],
#   ["The Goldfinch", 4.5, "Fiction"],
#   ["Shantaram", 4.7, "Adventure"],
#   ["The Poisonwood Bible", 4.6, "Fiction"],
#   ["A Thousand Splendid Suns", 4.8, "Fiction"],
#   ["The Glass Castle", 4.6, "Memoir"],
#   ["Siddhartha", 4.5, "Philosophical"],
#   ["Love in the Time of Cholera", 4.4, "Romance"],
#   ["American Gods", 4.3, "Fantasy"],
#   ["Good Omens", 4.7, "Fantasy"],
#   ["The Stand", 4.5, "Horror"],
#   ["It", 4.4, "Horror"],
#   ["11/22/63", 4.8, "Science Fiction"],
#   ["The Pillars of the Earth", 4.7, "Historical"],
#   ["Outlander", 4.6, "Historical"],
#   ["The Giver", 4.5, "Dystopian"],
#   ["Ender's Game", 4.8, "Science Fiction"],
#   ["Foundation", 4.7, "Science Fiction"],
#   ["Hyperion", 4.6, "Science Fiction"],
#   ["Neuromancer", 4.4, "Cyberpunk"],
#   ["Snow Crash", 4.3, "Cyberpunk"],
#   ["The Left Hand of Darkness", 4.5, "Science Fiction"],
#   ["Mistborn: The Final Empire", 4.7, "Fantasy"],
#   ["The Way of Kings", 4.8, "Fantasy"],
#   ["Elantris", 4.6, "Fantasy"],
#   ["The Blade Itself", 4.4, "Fantasy"],
#   ["A Game of Thrones", 4.8, "Fantasy"],
#   ["Harry Potter and the Sorcerer's Stone", 4.9, "Fantasy"],
#   ["The Hunger Games", 4.6, "Dystopian"],
#   ["Divergent", 4.4, "Dystopian"],
#   ["Twilight", 4.0, "Romance"],
#   ["Eragon", 4.3, "Fantasy"],
#   ["Red Rising", 4.5, "Science Fiction"],
#   ["The Martian", 4.8, "Science Fiction"],
#   ["Ready Player One", 4.7, "Science Fiction"],
#   ["Children of Time", 4.6, "Science Fiction"]
# ]

# puts "Seeding books..."
# # There are some issues with this. It won't seed all of them - not every search result h
# #  for i in 0...books.length do
# #    if !Book.exists?(title: books[i][0])
# #      url = "https://www.googleapis.com/books/v1/volumes?q=#{(books[i][0])}&key=#{ENV["GOOGLE_API_KEY"]}"
# #      response = URI.parse(url).read
# #      data = JSON.parse(response)
# #      Book.create!(
# #        title: books[i][0],
# #        author: data.dig("items", 0, "volumeInfo", "authors", 0) || "Unknown Author",
# #        year_published: data["items"][0]["volumeInfo"]["publishedDate"],
# #        summary: data["items"][0]["volumeInfo"]["description"],
# #        page_count: data["items"][0]["volumeInfo"]["pageCount"],
# #        cover_url: data["items"][0]["volumeInfo"]["imageLinks"]&.dig("smallThumbnail"),
# #        key: data["items"][0]["id"],
# #        overall_rating: books[i][1],
# #        genre: books[i][2]
# #      )
# #    end
# #  end
# selected_book = nil # Placeholder to track one book for tracker creation

# for i in 0...books.length do
#   if !Book.exists?(title: books[i][0])
#     url = "https://www.googleapis.com/books/v1/volumes?q=#{(books[i][0])}&key=#{ENV['GOOGLE_API_KEY']}"

#     begin
#       response = URI.open(url).read
#       data = JSON.parse(response)

#       # Skip the book if no results are found
#       if data["totalItems"] > 0
#         first_result = data["items"][0]["volumeInfo"]

#         created_book = Book.create!(
#           title: books[i][0],
#           author: first_result.dig("authors", 0) || "Unknown Author",
#           year_published: first_result["publishedDate"],
#           summary: first_result["description"],
#           page_count: first_result["pageCount"],
#           cover_url: first_result.dig("imageLinks", "smallThumbnail"),
#           key: data["items"][0]["id"],
#           overall_rating: books[i][1],
#           genre: books[i][2]
#         )

#         # Use the first seeded book for tracker and sessions
#         selected_book ||= created_book
#       else
#         puts "No results found for '#{books[i][0]}'"
#       end
#     rescue => e
#       puts "Error processing '#{books[i][0]}': #{e.message}"
#     end
#   end
# end

# puts "Book selection: #{selected_book&.title || 'None'}"
# puts "Books seeded!"

# if selected_book
#   # Create a user for testing purposes
#   user = User.create!(
#     email: 'testuser@example.com',
#     password: 'password', # Replace with hashed password
#     first_name: 'John',
#     last_name: 'Doe',
#     username: 'johndoe'
#   )

#   # Create a reading list for the selected book
#   reading_list = ReadingList.create!(
#     user: user,
#     book: selected_book,
#     active: true
#   )

#   # Create a tracker for the reading list
#   tracker = Tracker.create!(
#     reading_list: reading_list,
#     current_page: 250,
#     # total_minutes_spent: 300,
#     reading_status: 'In progress'
#   )

#   # Create reading sessions for the tracker
#   7.times do |i|
#     start_time = Time.current - (i + 1).days
#     duration = rand(10..60)*60 # Random duration between 10 and 60 minutes
#     ReadingSession.create!(
#       tracker: tracker,
#       duration: duration,
#       session_start: start_time,
#       session_end: start_time + duration, # Matches random duration
#       page_count: rand(10..60), # Random page count between 10 and 60
#       active: false
#     )
#   end

#   puts "Tracker and reading sessions created for the book: #{selected_book.title}"

#   # Create reviews from other users for the selected book
#   5.times do |i|
#     other_user = User.create!(
#       email: "user#{i + 1}@example.com",
#       password: 'password',
#       first_name: "User#{i + 1}",
#       last_name: "Reviewer#{i + 1}",
#       username: "user#{i + 1}"
#     )

#     # Create a review for the selected book by the user
#     Review.create!(
#       user: other_user,
#       book: selected_book,
#       rating: rand(1.0..5.0).round(1),
#       title: "Review by #{other_user.username}",
#       content: "This is a review by #{other_user.username}. I think this book is #{['amazing', 'great', 'good', 'average', 'not great'].sample}!"
#     )
#   end

#   puts "Reviews created for the book: #{selected_book.title}"
# end

books = Book.all
puts "Adding ratings to seeds.."
puts "Book Count:"
puts Book.count
counter = 0
books.each do |book|
  if book.overall_rating.nil? || book.overall_rating.nan?
    book.overall_rating = rand(3.5..4.8).round(1)
    book.save
  else
    counter += 1
  end
end

puts "Counter count:"
puts counter
