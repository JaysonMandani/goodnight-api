# Spec for SleepTrackers controller
require 'rails_helper'

RSpec.describe "Api::V1::SleepTrackersController", type: :request do
  before do
    @current_user = FactoryBot.create(:user) # First created user is a current_user
  end

  describe 'POST #create' do
    it 'should create sleep tracker with clock in' do
      post api_v1_sleep_trackers_path

      expect(@current_user.sleep_trackers.last.clock_in).not_to be_nil
    end
  end

  describe 'PUT #update' do
    it 'should follow the other user' do
      sleep_tracker = @current_user.sleep_trackers.create!

      put api_v1_sleep_tracker_path(id: sleep_tracker)

      expect(@current_user.sleep_trackers.last.clock_out).not_to be_nil
    end
  end
end
