# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

foo = User.create(
  username: 'Foo Bar',
  email: 'foo@bar.com',
  password: '123456'
)

foo.hosted_events.create(
  name: 'First Event',
  description: 'lorem ipsum',
  location: 'my house',
  date: DateTime.now
)
