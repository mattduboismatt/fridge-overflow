module ApplicationHelper
  def format_date
    self.strftime("%m/%d/%Y at %I:%M%p")
  end
end
