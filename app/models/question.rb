class Question < ActiveRecord::Base
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

  # "dbc, phase-1,   lucas-w, mike-b,lucas-w, wizardry,     watthefuck"
  def tag_names=(tag_names_string)
    # string
    tag_names = tag_names_string.split(",").map(&:strip).uniq
    # split into many strings
    # create associations to this entry
    tags = tag_names.map { |name|
      Tag.find_by(name: name) || Tag.new(name: name)
    }

    self.tags = tags
  end
end
