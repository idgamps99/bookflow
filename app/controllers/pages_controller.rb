class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @genres = Book.select(:genre).distinct

    @recommended_books = Book.order("RANDOM()").limit(5) #random for now, need logic later
    @top_picks = Book.order("RANDOM()").limit(5) # same
  end
end
