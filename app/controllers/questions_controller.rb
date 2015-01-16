class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root, unless: :'logged_in?', only: [:new]

  def index
    if params[:sort] == 'most_recent'
      @questions = Question.most_recent
    elsif params[:sort] == 'trending'
      @questions = Question.trending
    else
      @questions = Question.highest_voted
    end
  end

  def show
    @question.increment_visit_count
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @tagging = Tagging.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:notice] = 'Question not posted'
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def upvote
    @question = Question.find(params[:id])

    @vote = @question.votes.find_or_create_by(user: current_user)
    @vote.vote_value = 1
    @vote.save

    redirect_to(@question)
  end

  def downvote
    @question = Question.find(params[:id])

    @vote = @question.votes.find_or_create_by(user: current_user)
    @vote.vote_value = -1
    @vote.save

    redirect_to(@question)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
      params.require(:question).permit(:title, :content, :tag_names)
  end

  def redirect_to_root
    redirect_to root_path
    flash[:notice] = 'Must be logged in to post a question'
  end

  def increment_visit_count
    self.update_attribute(:visit_count, self.visit_count + 1)
  end

end

#  questions GET    /questions(.:format)          questions#index
#               POST   /questions(.:format)          questions#create
#  new_question GET    /questions/new(.:format)      questions#new
# edit_question GET    /questions/:id/edit(.:format) questions#edit
#      question GET    /questions/:id(.:format)      questions#show
#               PATCH  /questions/:id(.:format)      questions#update
#               PUT    /questions/:id(.:format)      questions#update
#               DELETE /questions/:id(.:format)      questions#destroy
