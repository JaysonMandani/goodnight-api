# This model handles the associations for followers
# and sleep_trackers
class User < ApplicationRecord
  has_many :sleep_trackers
  has_many :active_follows, foreign_key: :follower_id,
                            class_name: 'Follow',
                            dependent: :destroy
  has_many :passive_follows, foreign_key: :followed_id,
                             class_name: 'Follow',
                             dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows

  validates :name, presence: true

  def follow(other_user)
    active_follows.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  # It returns the from 1 week ago based on the requirement
  def last_week_sleep_tracks
    sleep_trackers.where("created_at >= ? AND created_at <= ?", 1.week.ago, Time.now)
                  .where.not(duration: nil)
                  .order(duration: :desc)
  end
end
