class ReadingListsController < ApplicationController
  before_action :deactivate

  def index
    @reading_lists = ReadingList.where(active: true)
  end

  def create
    @reading_list = ReadingList.new(reading_list_params)
    if @reading_list.save
      redirect_to reading_lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def deactivate
    @reading_list.active = false
  end

  private

  def reading_list_params
    params.require(:reading_list).permit(:user_id, :book_id, :active)
  end

  def set_reading_list
    @reading_list = ReadingList.find(params[:id])
  end
end
