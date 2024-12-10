require "json"
require "open-uri"

class BooksController < ApplicationController

  def index
    # if no search queries
    @books = Book.all

    # Please don't touch any of this or I will cry
    if params[:query].present?
      @books = title_search(params[:query])
    elsif params[:genre_query].present?
      @books = genre_search(params[:genre_query])
    end
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    # key_url = "https://openlibrary.org#{params[:key]}.json"
    # response = URI.parse(key_url).read
    # data = JSON.parse(response)

    # url = "https://openlibrary.org/search.json?q=#{data["title"]}&fields=key,title,author_name,isbn"
    # response = URI.parse(url).read
    # data = JSON.parse(response)
    # first = data["docs"].first
    # @book = Book.new(title: first["title"], author: first["author_name"][0])
  end

  private

  # Here be dragons. Pls don't touch this or i will cry, ta
  def title_search(query)
    url = "https://www.googleapis.com/books/v1/volumes?q=#{(query)}&startIndex=0&maxResults=40&key=#{ENV["GOOGLE_API_KEY"]}"
    books = base_search(query, url)
  end

  def genre_search(query)
    url = "https://www.googleapis.com/books/v1/volumes?q=subject:#{query}&startIndex=0&maxResults=40&key=#{ENV["GOOGLE_API_KEY"]}"
    books = base_search(query, url)
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
