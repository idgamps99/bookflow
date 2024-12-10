class ReadingSessionsController < ApplicationController
  before_action :set_tracker

  def create
    @reading_session = ReadingSession.new()
    @reading_session.session_start = Time.now
    @reading_session.tracker = @tracker
    if @reading_session.save
      redirect_to reading_list_path(@tracker.reading_list), notice: "Reading session successfully created."
    else
      redirect_to reading_list_path(@tracker.reading_list), alert: "Reading session could not be created."
    end
  end

  def update
    @reading_session = ReadingSession.find_by(tracker_id: @tracker)
    # @reading_session = ReadingSession.find(params[:id])
    # raise
    @reading_session.session_end = Time.now
    @reading_session.duration = @reading_session.session_end - @reading_session.session_start
    @reading_session.save
    redirect_to reading_list_path(@reading_session.tracker.reading_list), notice: "Reading session successfully ended."
  end

  private

  # def reading_session_params
  #   params.require(:reading_session).permit(:session_start, :session_end, :duration)
  # end

  def set_tracker
    @tracker = Tracker.find(params[:tracker_id])
  end

end
