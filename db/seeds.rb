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
