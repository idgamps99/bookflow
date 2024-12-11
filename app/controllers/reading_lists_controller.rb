class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:show, :deactivate]

  def index
    @reading_lists = ReadingList.where(active: true)
    @reading_lists_done = ReadingList.where(active: false)
  end

  def show
    @tracker = Tracker.find_by(reading_list_id: @reading_list)
    @reading_session = ReadingSession.find_by(tracker_id: @tracker, active: true)
  end

  def create
    @user = current_user
    @book = Book.find(params[:book_id])
    @reading_list = ReadingList.new()
    @reading_list.user = @user
    @reading_list.book = @book
    if @reading_list.save
      redirect_to reading_lists_path, notice: "Book successfully added to your reading list."
    else
      @reading_list = ReadingList.find_by(user: current_user, book: params[:book_id])
      @reading_list.active = true
      @reading_list.save
      redirect_to reading_lists_path, alert: "Book has been reactivated."
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
