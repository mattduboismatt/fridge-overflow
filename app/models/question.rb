class Question < ActiveRecord::Base
  before_create :set_defaults

  belongs_to :user
  has_many :answers
  has_one :best_answer, class_name: 'Answer'
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes, as: :votable
  has_many :responses, as: :responsive

  def tag_names
    tags.pluck(:name).join(", ")
  end

  def tag_names=(tag_names_string)
    tag_names = tag_names_string.split(",").map(&:strip).uniq
    tags = tag_names.map { |name|
      Tag.find_by(name: name) || Tag.new(name: name)
    }
    self.tags = tags
  end


  def created_at_formatted
    self.created_at.strftime("%m/%d/%Y at %I:%M%p")
  end

  private
  def set_defaults
    self.slug = self.title.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ').join('-')
    self.visit_count = 0
  end

end
