# Returns the id followed_id and follower_id
class FollowSerializer < ActiveModel::Serializer
  attributes :id, :follower_id, :followed_id
end
