class String
  def to_slug
    self.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ').join('-')
  end
end
