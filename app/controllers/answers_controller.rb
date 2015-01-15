class AnswersController < ApplicationController
  # before_action :set_answer

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@answer.question, {:id => @answer.question}), notice: 'Answer was successfully created.' }
      else
        format.html { redirect_to question_path(@answer.question), notice: 'Could not create answer.' }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  # def set_answer
  #   @answer = Answer.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end

end