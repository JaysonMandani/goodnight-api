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

  def follow
    @user = User.find(params[:id])

    if @user.present?
      current_user.follow(@user)
      render json: @user, status: :ok
    else
      render json: { error: "User not found!" }, status: :bad_request
    end
  end

  def unfollow
    @user = User.find(params[:id])

    if @user.present?
      current_user.unfollow(@user)
      render json: @user, status: :ok
    else
      render json: { error: "User not found!" }, status: :bad_request
    end
  end

  def user_params
    params.require(:user).permit(:id, :name)
  end
end
