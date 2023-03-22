# Create seeds for test data
# User
User.create!(name: "Sample User")

50.times do |n|
  name = Faker::Name.name
  User.create!(name: name)
end

# Follow
users = User.all
user = users.first
user.follow(user) # It should always follow their own account for default to show their own sleep trackers

following = users[2..40]
followers = users[3..30]

following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Sleep Tracker
10.times do |n|
  user.sleep_trackers.create!
  users.last.sleep_trackers.create!(clock_in: Time.now - 8.hours, clock_out: Time.now, duration: n + 2)
end
