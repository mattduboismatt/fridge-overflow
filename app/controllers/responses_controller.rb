class ResponsesController < ApplicationController

  def new
    @response = Response.new
  end

  def create
    if response_params[:responsible_type] == "question"
      @responsible = Question.find_by_id(response_params[:responsible_id])
    else
      @responsible = Answer.find_by_id(response_params[:responsible_id])
    end

    @response = @responsible.responses.new(content: response_params[:content])

    @response.user = current_user

    @question = Question.find_by_id(response_params[:question_id])

    respond_to do |format|
      if @response.save
        format.html { redirect_to question_path(@question, {:id => @question}), notice: 'Comment successfully posted.' }
        format.js { redirect_to question_path(@question, {:id => @question}), notice: 'Comment successfully posted.' }
      else
        format.html { redirect_to question_path(@question), notice: 'Could not post comment.' }
      end
    end
  end

  def update
  end

  def destroy
  end

  def upvote
    @response = Response.find(params[:id])

    @vote = @response.votes.find_or_create_by(user: current_user)
    @vote.vote_value = 1
    @vote.save

    # @response.votes.create!(user: current_user, vote_value: 1)

    if @response.responsive.class == Question
      @responsible = @response.responsive
    else
      answer = @response.responsive
      @responsible = answer.question
    end

    redirect_to(@responsible)
  end

  def downvote
    @response = Response.find(params[:id])

    @vote = @response.votes.find_or_create_by(user: current_user)
    @vote.vote_value = -1
    @vote.save

    # @response.votes.create!(user: current_user, vote_value: -1)


    if @response.responsive.class == Question
      @responsible = @response.responsive
    else
      answer = @response.responsive
      @responsible = answer.question
    end

    redirect_to(@responsible)
  end

  private

  def response_params
    params.require(:response).permit(:content, :responsible_id, :responsible_type, :question_id)
  end

end