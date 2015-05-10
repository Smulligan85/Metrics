# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.save!
end

users = User.all

50.times do
  registered_application = RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Company.name,
    url: Faker::Internet.url
    )
end

registered_applications = RegisteredApplication.all

70.times do
  events = Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Lorem.words
    )
end

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} Registered Applications were created."
puts "#{Event.count} events were created."