# This controller handles the creation of the user
# using the show method it render all the data
# for user and sleep_trackers

class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message: "success", user: @user }, status: :created
    else
      render json: { message: "error", errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])

    if @user.present?
      render json: @user, status: :ok
    else
      render json: { error: "User not found!" }, status: :bad_request
    end
  end

  def user_params
    params.require(:user).permit(:id, :name)
  end
end
