class ReviewsController < ApplicationController
  before_action :set_book

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @book, notice: 'Review created.'
    else
      render 'books/show', status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
