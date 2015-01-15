class User < ActiveRecord::Base
  before_save :set_slug

  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes
  has_secure_password

  def set_slug
    self.slug = self.username.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ').join('-')
  end

end
