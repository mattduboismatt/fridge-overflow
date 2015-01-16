class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def show
  end

  def index
    @tags = Tag.all
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
