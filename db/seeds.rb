# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create!(username: 'i eat off the floor', email: 'gross@example.com', password: 'test')

  10. times do
    Question.create!(title: "random", content: "jargon", user: u)
  end
  5. times do
    Answer.create!(content: "ASFASFASFASFASFASFAS", user: u, question_id: 1)
  end

require 'ffaker'

# create users
users = rand(5..15).times.map do
  User.create!({
    username: Faker::Name.name,
    password: "password",
    password_confirmation: "password",
    email: Faker::Internet.email,
    location: Faker::Address.city,
    age: rand(15..99),
    bio: Faker::Lorem.paragraph,
    avatar: rand(1..10).to_s,
    registered_at: Faker::Time.date
  })
end
# create questions
questions = 10.times.map do
  length = rand(2..20)
  users.sample.questions.create!({
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph(length),
  })
end

questions.each { |question| question.set_posted_at }

# create answers for each question
answers = 30.times.map do
  questions.sample.answers.create!({
    content: Faker::Lorem.paragraph(1),
    user: users.sample,
    posted_at: Faker::Time.date,
    best: false
  })
end
bests = questions.map {|q| q.answers.sample}.sample(3).each {|q| q.update(best: true) }

# create tags for each question
20.times do
  questions.sample.tags.create!(word: Faker::Lorem.word)
end

# create responses for some questions and answers
respondables = [questions, answers].flatten
responses = 50.times.map do
  respondables.sample.responses.create!(content: Faker::Lorem.sentence, posted_at: Faker::Time.date, user: users.sample)
end
respondables += responses

# create votes for everything that should be voted on
respondables.each do |item|
  rand(1..5).times do
    item.votes.create!(user: users.sample)
  end
end
