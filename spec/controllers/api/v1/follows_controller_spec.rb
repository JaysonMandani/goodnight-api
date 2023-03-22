require 'rails_helper'

RSpec.describe "Api::V1::FollowsController", type: :request do
  before do
    @current_user = FactoryBot.create(:user) # First created user is a current_user
  end

  describe 'POST #create' do
    it 'should follow the other user' do
      user_2 = FactoryBot.create(:user)

      post api_v1_follows_path(followed_id: user_2)

      expect(@current_user.following?(user_2)).to be_truthy
    end
  end

  describe 'DELETE #destroy' do
    it 'should follow the other user' do
      user_2 = FactoryBot.create(:user)
      @current_user.follow(user_2)
      follow = @current_user.active_follows.where(followed_id: user_2).take

      delete api_v1_follow_path(id: follow.id)

      expect(@current_user.following?(user_2)).to be_falsey
    end
  end
end
