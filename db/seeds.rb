# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  10. times do
    Question.create!(title: "random", content: "jargon")
  end
  5. times do
    Answer.create!(content: "ASFASFASFASFASFASFAS", user_id: 1, question_id: 1)
  end
