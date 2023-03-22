# This controller handles the follow and unfollow
# it needs to supply the followed_id and follow_id for
# create and update
class Api::V1::FollowsController < ApplicationController
  def create
    user = User.find(params[:followed_id])

    if user.present?
      current_user.follow(user)
      render json: { message: "Succesfully follow #{user.name}" }, status: :ok
    else
      render json: { error: "User not found!" }, status: :bad_request
    end
  end

  def destroy
    user = Follow.find(params[:id]).followed

    if user.present?
      current_user.unfollow(user)
      render json: { message: "Succesfully unfollow #{user.name}" }, status: :ok
    else
      render json: { error: "User not found!" }, status: :bad_request
    end
  end
end
