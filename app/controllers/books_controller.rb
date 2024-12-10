require "json"
require "open-uri"

class BooksController < ApplicationController

  def index
    @books = Book.all
    # if params[:query].present? || params[:genre_query].present?
    #   @books = @books.search_by_title(params[:query]) if params[:query].present?
    #   @books = @books.search_by_genre(params[:genre_query]) if params[:genre_query].present?
    # end

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
      # @book[:author] = book["docs"][0]["author_name"]
      # @book[:cover_url] = "https://covers.openlibrary.org/b/isbn/#{book["docs"][0]["isbn"][0]}-M.jpg"
    end
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
  end

end
