# Users
User.create!(name:  "Scary Steph",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated:    true,
             activated_at: Time.zone.now)
49.times do |n|
  name  = Faker::Games::WarhammerFantasy.hero
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated:    true,
               activated_at: Time.zone.now)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::TvShows::TwinPeaks.quote
  users.each { |user| user.microposts.create!(content: content) }
end

users= User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
