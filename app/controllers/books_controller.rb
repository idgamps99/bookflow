require "json"
require "open-uri"

class BooksController < ApplicationController

  def index
    # TODO: There's an error when there are no search queries
    # Seeds don't currently have a key, so the helper can't build a path to the display page oops
    # The API call also doesn't return any ratings. Unsure what to do with that atm
    @books = Book.all

    # TODO: Enable multiple search queries
    if params[:query].present?
      @books = title_search(params[:query])
    elsif params[:genre_query].present?
      @books = genre_search(params[:genre_query])
    end
  end

  def show
    # TODO: CHECK IF BOOK IS IN DB OR NOT BEFORE MAKING API CALL!
    @review = Review.new
    @book = show_page_search(params[:key])
  end

  private

  # Here be dragons. Pls don't touch this or i will cry, ta
  def show_page_search(key)
    url = "https://www.googleapis.com/books/v1/volumes/#{key}?key=#{ENV['GOOGLE_API_KEY']}"
    response = URI.parse(url).read
    data = JSON.parse(response)
    Book.new(
      title: data["volumeInfo"]["title"],
      year_published: data["volumeInfo"]["publishedDate"],
      summary: data["volumeInfo"]["description"],
      author: data["volumeInfo"]["authors"][0],
      page_count: data["volumeInfo"]["pageCount"],
      cover_url: data["volumeInfo"]["imageLinks"]&.dig("smallThumbnail")
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
