require "json"
require "open-uri"

class BooksController < ApplicationController

  def index
    # If no API call
    @books = Book.all

    # If search queries are present, call API
    if params[:query].present?
      @books = title_search(params[:query])
    elsif params[:genre_query].present?
      @books = genre_search(params[:genre_query])
    end
  end

  def show
    @review = Review.new
    # Return instance of book if already in DB, else create a new instance for that book
    if @book = Book.find_by(key: params[:key])
      @book
    else
      @book = show_page_search(params[:key])
    end
  end

  private

  # Here be dragons. Pls don't touch this or i will cry, ta
  # TODO: still don't have a rating when you create a new book 
  def show_page_search(key)
    url = "https://www.googleapis.com/books/v1/volumes/#{key}?key=#{ENV['GOOGLE_API_KEY']}"
    response = URI.parse(url).read
    data = JSON.parse(response)
    Book.create!(
      title: data["volumeInfo"]["title"],
      author: data["volumeInfo"]["authors"][0],
      year_published: data["volumeInfo"]["publishedDate"],
      summary: data["volumeInfo"]["description"],
      page_count: data["volumeInfo"]["pageCount"],
      cover_url: data["volumeInfo"]["imageLinks"]&.dig("smallThumbnail"),
      key: key
    )
  end

  # or this
  def title_search(query)
    url = "https://www.googleapis.com/books/v1/volumes?q=#{(query)}
            &startIndex=0&maxResults=40&key=#{ENV["GOOGLE_API_KEY"]}"
    books = base_search(query, url)
  end

  # and this
  def genre_search(query)
    url = "https://www.googleapis.com/books/v1/volumes?q=subject:#{query}
            &startIndex=0&maxResults=40&key=#{ENV["GOOGLE_API_KEY"]}"
    books = base_search(query, url)
  end

  # and especially this
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
