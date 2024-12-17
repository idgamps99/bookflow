class TrackersController < ApplicationController

  def index
    @reading_lists = ReadingList.where(active: true, user_id: current_user)
    @trackers = Tracker.where(reading_list_id: @reading_lists).order(updated_at: :desc)
    @reading_lists_all = ReadingList.where(user_id: current_user)
    @trackers_all = Tracker.where(reading_list_id: @reading_lists_all)
    @total_current_pages = Tracker.where(reading_list_id: @reading_lists_all).sum(:current_page)
    @total_minutes_spent = Tracker.where(reading_list_id: @reading_lists_all).sum(:total_minutes_spent)
  end

  def create
    @reading_list = ReadingList.find(params[:reading_list_id])
    @tracker = Tracker.new()
    @tracker.reading_list = @reading_list
    if @tracker.save
      redirect_to reading_list_path(@reading_list)
    else
      redirect_to reading_list_path(@reading_list)
    end
  end

  # def update
  #   @tracker = Tracker.find(params[:id])
  #   @reading_session = ReadingSession.find_by(tracker_id: @tracker).last
  #   @tracker.current_page = @reading_session.page_count
  #   @tracker.update
  # end

  private

  # def tracker_params
  #   params.require(:tracker).permit(:current_page, :total_minutes_spent, :reading_status)
  # end

end
