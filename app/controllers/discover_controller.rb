class DiscoverController < ApplicationController
  def index
    @genres = Book.select(:genre).distinct

    @recommended_books = Book.order("RANDOM()").limit(5)
    @top_picks = Book.where.not(id: @recommended_books.pluck(:id)).order("RANDOM()").limit(5)
  end
end
