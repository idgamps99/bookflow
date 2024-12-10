class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:show, :deactivate]

  def index
    @reading_lists = ReadingList.where(active: true)
    @reading_lists_done = ReadingList.where(active: false)
  end

  def show
  end

  # def check_list_exists
  #   @reading_list = ReadingList.find_by(user: current_user, book: Book.find(params[:book_id]))
  #   if @reading_list
  #     deactivate()
  #   else
  #     create()
  #   end
  # end

  def create
    @user = current_user
    @book = Book.find(params[:book_id])
    @reading_list = ReadingList.new()
    @reading_list.user = @user
    @reading_list.book = @book
    if @reading_list.save
      redirect_to reading_lists_path, notice: "Book successfully added to your reading list."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def deactivate
    @reading_list.active = !@reading_list.active
    if @reading_list.save
      redirect_to reading_lists_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_reading_list
    @reading_list = ReadingList.find(params[:id])
  end
end
