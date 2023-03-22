class Api::V1::SleepTrackersController < ApplicationController
  def index
    @sleep_trackers = current_user.sleep_trackers.order(created_at: :desc)

    render json: @sleep_trackers, status: :ok
  end

  # Needs more enhancement for error handling
  # I just want to demonstrate the logic here
  # for clock_in and clock_out
  def create
    @sleep_tracker = current_user.sleep_trackers.create!

    render json: @sleep_tracker, status: :ok
  end

  def update
    @sleep_tracker = current_user.sleep_trackers.find(params[:id])
    @sleep_tracker.clock_out!

    render json: @sleep_tracker, status: :ok
  end
end
