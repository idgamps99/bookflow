require "json"
require "open-uri"

class FetchGenresJob < ApplicationJob
  queue_as :default

  def perform
    genres = { Fantasy: [], Novels: [], Romance: [], Thriller: [], Mystery: [], Crime: [] }
    genres.each do |key, value|
      value.concat(genre_search(key.to_s))
    end
    
    Rails.cache.write('genres', genres, expires_in: 24.hours)
  end

  private

  def genre_search(query)
    url = "https://www.googleapis.com/books/v1/volumes?q=subject:#{query}&startIndex=0&maxResults=40&key=#{ENV["GOOGLE_API_KEY"]}"
    base_search(query, url)
  end

  def base_search(query, url)
    books = []
    response = URI.parse(url).read
    data = JSON.parse(response)

    data["items"].each do |d|
      book = Book.new
      cover_url =  d["volumeInfo"]["imageLinks"]&.dig("smallThumbnail")
      book[:cover_url] = cover_url
      book.key = d["id"]
      books << book
    end

    books
  end
end
