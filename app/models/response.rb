class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :responsive, polymorphic: true
  has_many :votes, as: :votable
end
