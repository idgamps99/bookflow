class TrackersController < ApplicationController

  def create
    @reading_list = ReadingList.find(params[:reading_list_id])
    @tracker = Tracker.new()
    @tracker.reading_list = @reading_list
    if @tracker.save
      redirect_to reading_list_path(@reading_list), notice: "Tracker successfully created."
    else
      redirect_to reading_list_path(@reading_list), alert: "Tracker could not be created."
    end
  end

  # def update
  #   @tracker = Tracker.find(params[:id])
  # end

  private

  # def tracker_params
  #   params.require(:tracker).permit(:current_page, :total_minutes_spent, :reading_status)
  # end

end
