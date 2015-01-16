class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :responsive, polymorphic: true
  has_many :votes, as: :votable

  validates :content,
            presence: true,
            length: { minimum: 2, maximum: 1000 }


end
