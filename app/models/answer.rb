class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :responses, as: :responsive
  has_many :votes, as: :votable

  validates :content,
            presence: true,
            length: {minimum: 2, maximum: 2000}
end
