class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:show, :deactivate]

  def index
    @reading_lists = ReadingList.where(active: true, user_id: current_user)
    @reading_lists_done = ReadingList.where(active: false, user_id: current_user)
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
        format.html { redirect_to @book, notice: "Book successfully added to your reading list." }
        format.js   # Trigger JS response for dynamic update
      end
    else
      @reading_list = ReadingList.find_by(user: current_user, book: @book)
      @reading_list.active = true
      @reading_list.save
      respond_to do |format|
        format.html { redirect_to @book, alert: "Book has been reactivated." }
        format.js   # Trigger JS response for dynamic update
      end
    end
  end

  def deactivate
    @reading_list.active = false
    @reading_list.save
    redirect_to reading_lists_path, notice: "Book successfully removed from your reading list."
  end

  private

  def set_reading_list
    @reading_list = ReadingList.find(params[:id])
  end
end
