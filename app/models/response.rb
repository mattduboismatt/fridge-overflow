class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :responsive, polymorphic: true
  has_many :votes, as: :votable

  #validate all belongs_to again... and NOT the foreign key, just the object

  validates :content,
            presence: true,
            length: { minimum: 2, maximum: 1000 }


end
