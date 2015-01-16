class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :vote_value,
            presence: true,
            numericality: true

end
