class BooksController < ApplicationController
  def index
    if params[:genre].present?
      @books = Book.where(genre: params[:genre])
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
