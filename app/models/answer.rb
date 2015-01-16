class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  # add a validation for all belongs_to -> validates :question, presence: true
  # AKA stay away from validating the id of the association
  has_many :responses, as: :responsive
  has_many :votes, as: :votable

  validates :content,
            presence: true,
            length: {minimum: 2, maximum: 2000}
end
