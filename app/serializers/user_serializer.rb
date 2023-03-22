class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :sleep_trackers, if: :following? do
    object.last_week_sleep_tracks
  end

  def following?
    current_user.following?(object)
  end
end
