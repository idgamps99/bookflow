require "json"
require "open-uri"

class BooksController < ApplicationController

  def index
    @books = Book.all
    # if params[:query].present? || params[:genre_query].present?
    #   @books = @books.search_by_title(params[:query]) if params[:query].present?
    #   @books = @books.search_by_genre(params[:genre_query]) if params[:genre_query].present?
    # end

  end

  def show
    @book = Book.find(params[:id])
  end

  private


end
