require "json"
require "open-uri"

class BooksController < ApplicationController

  def index
    # if no search queries
    @books = Book.all

    # Please don't touch any of this or I will cry
    if params[:query].present?
      @books = []
      url = "https://openlibrary.org/search.json?q=#{params[:query]}&fields=key,title,author_name,isbn"
      response = URI.parse(url).read
      data = JSON.parse(response)
      data["docs"].each do |d|
        if d["isbn"]
          book = Book.new
          cover_url = "https://covers.openlibrary.org/b/isbn/#{d["isbn"][0]}-M.jpg"
          book[:cover_url] = cover_url
          @books << book
        end
      end
    elsif params[:genre_query].present?
      @books = []
      url = "https://openlibrary.org/search.json?subject=#{params[:genre_query]}&fields=key,title,author_name,isbn"
      response = URI.parse(url).read
      data = JSON.parse(response)
      data["docs"].each do |d|
        if d["isbn"]
          book = Book.new
          cover_url = "https://covers.openlibrary.org/b/isbn/#{d["isbn"][0]}-M.jpg"
          book[:cover_url] = cover_url
          @books << book
        end
      end
    end
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
  end
end
