class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.first # Lets assumed this user is always authenticated
  end
end
