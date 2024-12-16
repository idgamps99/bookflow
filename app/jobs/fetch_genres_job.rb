class FetchGenresJob < ApplicationJob
  queue_as :default

  def perform
    genres = { Fantasy: [], Novels: [], Romance: [], Thriller: [], Mystery: [], Crime: [] }
    genres.each do |key, value|
      value.concat(genre_search(key.to_s))
    end

    # Save the result to Rails cache, or you could use a database or another persistence method
    Rails.cache.write('genres', genres, expires_in: 24.hours)
  end

  private

  # Search for books for a given genre
  def genre_search(query)
    url = "https://www.googleapis.com/books/v1/volumes?q=subject:#{query}&startIndex=0&maxResults=40&key=#{ENV["GOOGLE_API_KEY"]}"
    base_search(query, url)
  end

  # Fetch the book data from the API and return an array of books
  def base_search(query, url)
    books = []
    response = URI.parse(url).read
    data = JSON.parse(response)

    # Iterate through the API data to extract the relevant information for each book
    data["items"].each do |d|
      book = Book.new
      cover_url =  d["volumeInfo"]["imageLinks"]&.dig("smallThumbnail")
      book[:cover_url] = cover_url
      book.key = d["id"]
      books << book
    end

    books
  end
