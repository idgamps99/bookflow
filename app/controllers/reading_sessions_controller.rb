class ReadingSessionsController < ApplicationController
  before_action :set_tracker

  def create
    @reading_session = ReadingSession.new()
    @reading_session.session_start = Date.current
    @reading_session.tracker = @tracker
    if @reading_session.save
      @reading_session.session_start = @reading_session.created_at
      @reading_session.save
      redirect_to reading_list_path(@tracker.reading_list), notice: "Reading session successfully created."
    else
      redirect_to reading_list_path(@tracker.reading_list), alert: "Reading session could not be created."
    end
  end

  def update
    @reading_session = ReadingSession.find_by(tracker_id: @tracker)
    @reading_session.session_end = Date.current
    @reading_session.save
    @reading_session.session_end = @reading_session.updated_at
    @reading_session.duration = (@reading_session.session_end.to_time - @reading_session.session_start.to_time)
    @reading_session.active = false
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
