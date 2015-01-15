class User < ActiveRecord::Base
  before_create :set_defaults

  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes
  has_secure_password

  def set_defaults
    self.slug = self.username.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ').join('-')
  end

end
