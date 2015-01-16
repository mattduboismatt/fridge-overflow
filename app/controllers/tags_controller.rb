class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def show
    if params[:sort] == 'most_recent'
      @tag_questions = @tag.questions.most_recent
    elsif params[:sort] == 'trending'
      @tag_questions = @tag.questions.trending
    else
      @tag_questions = @tag.questions.highest_voted
    end
  end

  def index
    @tags = Tag.all
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
