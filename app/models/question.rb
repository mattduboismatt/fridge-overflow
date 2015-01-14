class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :best_answer, class_name: 'Answer'
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes, as: :votable
  has_many :responses, as: :responsive
end
