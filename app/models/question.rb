include ApplicationHelper

class Question < ActiveRecord::Base
  before_create :set_defaults

  belongs_to :user
  has_many :answers
  has_one :best_answer, class_name: 'Answer'
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes, as: :votable
  has_many :responses, as: :responsive

  def self.highest_voted
    self.all.sort_by {|q| q.votes.count }.reverse
  end

  def self.most_recent
    self.all.sort_by {|q| q.created_at }.reverse
  end

  def self.trending
    self.all.sort_by {|q| q.visit_count }.reverse
  end

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


  def increment_visit_count
    self.update_attribute(:visit_count, self.visit_count + 1)
  end


  private
  def set_defaults
    self.slug ||= self.title.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ').join('-')
    self.visit_count ||= 0
  end

end
