# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# create users
users = rand(5..15).times.map do
  User.create!({
    username: Faker::Commerce.product_name,
    real_name: Faker::Name.name,
    password: "password",
    password_confirmation: "password",
    email: Faker::Internet.email,
    location: Faker::Address.city,
    website: Faker::Internet.url,
    age: rand(18..99),
    profile_picture: rand(1..10).to_s,
  })
end
# create questions
questions = 10.times.map do
  length = rand(5..40)
  users.sample.questions.create!({
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph(length),
  })
end

# create answers for each question
answers = 30.times.map do
  questions.sample.answers.create!({
    content: Faker::Lorem.paragraph(1),
    user: users.sample,
  })
end
bests = questions.map {|q| q.best_answer = answers.sample }

foods = %w(bacon cheese spill spicy human-flesh leftovers duck spaghetti squash seaman greek sushi plum banana orange meat sniff mold dirt oven cronut cookie cake veggies)

# create tags for each question
30.times do
  tag = Tag.find_or_create_by!(name: foods.sample)
  questions.sample.tags << tag
end

# create responses for some questions and answers
respondables = [questions, answers].flatten
responses = 50.times.map do
  respondables.sample.responses.create!(content: Faker::Lorem.sentence, user: users.sample)
end
respondables += responses

# create votes for everything that should be voted on
respondables.each do |item|
  rand(1..5).times do
    item.votes.create!(user: users.sample, vote_value: [-1,1,1,1].sample)
  end
end
