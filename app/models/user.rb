class User < ActiveRecord::Base
  before_create :set_defaults

  validates :real_name, :password_confirmation, presence: true

  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
            presence: true,
            uniqueness: true

  validates :age,
            numericality: true,
            presence: true,
            inclusion: {in:18..120}

  validates :password,
            confirmation: true,
            presence: true

  validates :username,
            uniqueness: true,
            presence: true


  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes
  has_secure_password

  def set_defaults
    self.slug ||= self.username.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ').join('-')
  end

end
