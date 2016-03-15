class QuestionsController < ApplicationController
  before_action :find_answer, only: :create

  def create
    @question = @answer.questions.new(question_params)
    @question.save
    flash[:notice] = "Question successfully assigned to  #{@answer.name}"
    redirect_to edit_answer_path(@answer)
  end
  def destroy
    question = Question.find(params[:id])
    question.destroy
    flash[:notice] = "Question successfully deleted"
    redirect_to edit_answer_path(question.answer)
  end

  private

  def question_params
    params.require(:question).permit(:answer_id, :picture)
  end
  def find_answer
    @answer = Answer.find(params[:answer_id])
  end
end
