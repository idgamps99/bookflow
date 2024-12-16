class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @genres = Book.select(:genre).distinct

    @recommended_books = Book.order("RANDOM()").limit(6)
    @top_picks = Book.where.not(id: @recommended_books.pluck(:id)).order("RANDOM()").limit(4)
  end
end
