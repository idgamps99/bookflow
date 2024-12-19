class ReviewsController < ApplicationController
  before_action :set_book

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      @book.overall_rating = update_overall_rating(@book)
      @book.save
      redirect_to @book # , notice: 'Review created.'
    else
      render 'books/show', status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find_by(key: params[:book_key])
    @review = @book.reviews.find(params[:id])
  end

  def update
    @review = @book.reviews.find(params[:id])
    if @review.update(review_params)
      @book.overall_rating = update_overall_rating(@book)
      @book.save
      redirect_to @book # , notice: 'Review updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = @book.reviews.find(params[:id])
    @review.destroy
    @book.overall_rating = update_overall_rating(@book)
    @book.save
    redirect_to @book # , notice: 'Review deleted.'
  end

  private

  def set_book
    @book = Book.find_by(key: params[:book_key])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :title)
  end

  def update_overall_rating(book)
    # Need to change database cos this isn't ideal atm, not sure how to though
    book.overall_rating = 0 if book.overall_rating.nil?
    average_rating = book.reviews.sum(:rating) / book.reviews.count
  end
end
