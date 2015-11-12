require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  User.create!(name: Faker::Name.name)
end

1.upto(5) do |poll_num|
  Poll.create!(title: "Poll #{poll_num}", author_id: rand(1..50))
end

30.times do
  Question.create!(text: Faker::Hacker.say_something_smart + "?", poll_id: rand(1..5))
end

50.times do
  AnswerChoice.create!(text: Faker::Book.title, question_id: rand(1..30))
end

100.times do
  Response.create!(user_id: rand(1..50), answer_choice_id: rand(1..50siblin))
end
