# Specs for Users controller
require 'rails_helper'

RSpec.describe "Api::V1::UsersController", type: :request do
  before do
    @current_user = FactoryBot.create(:user) # First created user is a current_user
  end

  describe 'GET #show' do
    it 'should show the followed user sleep tracks' do
      user_2 = FactoryBot.create(:user)
      user_2.sleep_trackers.create!
      user_2.sleep_trackers.last.clock_out!
      @current_user.follow(user_2)
      get api_v1_user_path(id: user_2)

      data = JSON.parse response.body

      expect(data["sleep_trackers"]).not_to be_nil
    end

    it 'should not show the unfollowed user sleep tracks' do
      user_2 = FactoryBot.create(:user)
      user_2.sleep_trackers.create!
      user_2.sleep_trackers.last.clock_out!
      get api_v1_user_path(id: user_2)

      data = JSON.parse response.body

      expect(data["sleep_trackers"]).to be_nil
    end
  end
end
