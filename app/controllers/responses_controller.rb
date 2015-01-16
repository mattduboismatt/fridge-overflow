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

  private

  def response_params
    params.require(:response).permit(:content, :responsible_id, :responsible_type, :question_id)
  end

end