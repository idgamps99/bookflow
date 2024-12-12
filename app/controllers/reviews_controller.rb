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

  def edit
    @book = Book.find_by(key: params[:book_key])
    @review = @book.reviews.find_by(key: params[:book_key])
  end

  def update
    @review = @book.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to @book, notice: 'Review updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to @book, notice: 'Review deleted.'
  end

  private

  def set_book
    @book = Book.find_by(key: params[:book_key])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :title)
  end
end
