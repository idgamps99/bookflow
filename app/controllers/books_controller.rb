class BooksController < ApplicationController

  def index
    @books = Book.all

    if params[:query].present? || params[:genre_query].present?
      @books = @books.search_by_title_and_summary(params[:query]) if params[:query].present?
      @books = @books.search_by_genre(params[:genre_query]) if params[:genre_query].present?
    end
  end
end
