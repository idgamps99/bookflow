# class ReadingSessionsController < ApplicationController
#   before_action :set_tracker

#   def create
#     @reading_session = ReadingSession.new()
#     @reading_session.session_start = Date.current
#     @reading_session.tracker = @tracker
#     if @reading_session.save
#       @reading_session.session_start = @reading_session.created_at
#       @reading_session.save
#       redirect_to reading_list_path(@tracker.reading_list), notice: "Reading session successfully created."
#     else
#       redirect_to reading_list_path(@tracker.reading_list), alert: "Reading session could not be created."
#     end
#   end

#   def update
#     @reading_session = ReadingSession.find_by(tracker_id: @tracker)
#     @reading_session.session_end = Date.current
#     @reading_session.save
#     @reading_session.session_end = @reading_session.updated_at
#     @reading_session.duration = (@reading_session.session_end.to_time - @reading_session.session_start.to_time)
#     @reading_session.active = false
#     if @reading_session.save
#       redirect_to tracker_reading_session_path(@tracker, @reading_session), notice: "Reading session successfully ended."
#     else
#       redirect_to reading_list_path(@tracker.reading_list), alert: "Reading session could not end."
#     end
#   end

#   private

#   # def reading_session_params
#   #   params.require(:reading_session).permit(:session_start, :session_end, :duration)
#   # end

#   def set_tracker
#     @tracker = Tracker.find(params[:tracker_id])
#   end

# end

class ReadingSessionsController < ApplicationController
  before_action :set_tracker

  def create
    @reading_session = ReadingSession.new(session_start: Time.current, tracker: @tracker)

    if @reading_session.save
      # Log the session_start and redirect to the reading list
      redirect_to reading_list_path(@tracker.reading_list), notice: "Reading session successfully created."
    else
      redirect_to reading_list_path(@tracker.reading_list), alert: "Reading session could not be created."
    end
  end

  def update
    @reading_session = ReadingSession.find_by(tracker_id: @tracker.id, active: true)

    if @reading_session
      # Use strong parameters to set page_count
      if reading_session_params[:page_count].present?
        @reading_session.page_count = reading_session_params[:page_count]
      end
      # Set session_end and calculate duration
      @reading_session.session_end = Time.current
      @reading_session.duration = (@reading_session.session_end.to_time - @reading_session.session_start.to_time)
      @reading_session.active = false

      # Explicitly save the session with both session_start and session_end
      if @reading_session.save
        @tracker.current_page = @reading_session.page_count
        # @tracker.total_minutes_spent += @reading_session.duration
        # @tracker.reading_status = "Reading session ended"
        @tracker.save
        redirect_to reading_list_path(@tracker.reading_list), notice: "Reading session successfully ended."
      else
        redirect_to reading_list_path(@tracker.reading_list), alert: "Reading session could not end."
      end
    else
      redirect_to reading_list_path(@tracker.reading_list), alert: "No active reading session found."
    end
  end

  private

  def set_tracker
    @tracker = Tracker.find(params[:tracker_id])
  end

  def reading_session_params
    params.require(:reading_session).permit(:page_count)
  end
end
