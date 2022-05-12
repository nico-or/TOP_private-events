# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# 1 will be Foo.
USER_COUNT = 5
EVENT_COUNT = 10
ATTENDANCES_COUNT = USER_COUNT * 2

# Seed users
foo = User.create(
  username: 'Foo Bar',
  email: 'foo@bar.com',
  password: '123456'
)

2.upto USER_COUNT do
  name = Faker::Name.name
  User.create(
    username: name,
    email: Faker::Internet.free_email(name: name),
    password: 'password'
  )
end

# Seed Events
EVENT_COUNT.times do
  Event.create(
    host_id: rand(1..USER_COUNT),
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    location: Faker::Address.full_address,
    date: Faker::Date.forward.strftime('%Y-%m-%d')
  )
end

# Seed Attendances
ATTENDANCES_COUNT.times do
  Attendance.create(
    user_id: rand(1..USER_COUNT),
    event_id: rand(1..EVENT_COUNT)
  )
end
