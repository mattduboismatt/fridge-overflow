class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :responses, as: :responsive
  has_many :votes, as: :votable
end
