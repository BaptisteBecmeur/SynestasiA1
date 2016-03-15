class AnswersController < ApplicationController
  before_action :set_answer, only: [ :edit, :update, :destroy ]

  def index
    @answers = Answer.all.order(name: :asc)
  end
  def new
    @answer = Answer.new
  end
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer #{@answer.name} has been successfully created"
      redirect_to edit_answer_path(@answer)
    else
      flash[:alert] = "Error : Answer not created"
      render :new
    end
  end
  def edit
    @question = Question.new
    @questions = @answer.questions
  end
  def update
    @answer.update(answer_params)
    flash[:notice] = "Answer #{@answer.name} has been successfully updated"
    redirect_to answers_path
  end
  def destroy
    @answer.destroy
    flash[:notice] = "Answer #{@answer.name} has been successfully deleted"
    redirect_to answer_path
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
  def answer_params
    params.require(:answer).permit(:name, :picture)
  end
end
