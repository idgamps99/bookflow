class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:show, :deactivate, :mark_as_read]

  def index
    @reading_lists = ReadingList.where(active: true, user_id: current_user)
    @reading_lists_done = ReadingList.where(active: false, user_id: current_user)
    @books_read = current_user.reading_lists.where(read: true).includes(:book).map(&:book)

    # For reviews tab
    @reviews = Review.where(user_id: current_user)
    book_ids = @reviews.map { |review| review.book_id } # Extract all book IDs
    @books_reviewed = Book.where(id: book_ids)
  end

  def show
    @tracker = Tracker.find_by(reading_list_id: @reading_list)
    @reading_session = ReadingSession.find_by(tracker_id: @tracker, active: true)
    @reading_sessions_done = ReadingSession.where(tracker_id: @tracker, active: false)
  end

  def create
    @user = current_user
    @book = Book.find_by(key: params[:book_key])
    @reading_list = ReadingList.new
    @reading_list.user = @user
    @reading_list.book = @book

    if @reading_list.save
      respond_to do |format|
        format.html { redirect_to @book}
        format.js   # Trigger JS response for dynamic update
      end
    else
      @reading_list = ReadingList.find_by(user: current_user, book: @book)
      @reading_list.active = true
      @reading_list.save
      respond_to do |format|
        format.html { redirect_to @book }
        format.js   # Trigger JS response for dynamic update
      end
    end
  end

  def deactivate
    @reading_list.active = false
    @reading_list.save
    redirect_to reading_lists_path
  end

  def mark_as_read
    @reading_list.update(read: true)
    redirect_to book_path(@reading_list.book)
  end

  private

  # comment
  def set_reading_list
    @reading_list = ReadingList.find(params[:id])
  end
end
