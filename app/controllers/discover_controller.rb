class DiscoverController < ApplicationController
  def index
    @genres = Book.select(:genre).distinct

    @recommended_books = Book.order("RANDOM()").limit(5) #random for now, need logic later
    @top_picks = Book.order("RANDOM()").limit(5) # same
  end
end
