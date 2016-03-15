class GamesController < ApplicationController
attr_accessor :lvl

  def welcome
  end

  def congrat
  end

  def play
    lvlup(lvl)
    if lvl == 1
      set_questions
    else
      get_questions
    end
    @answers = Answer.where.not(id: question.answer_id).limit(2).order("RANDOM()")
    # @answers << question.answer
    @answers = @answers.shuffle
    render 'play'
  end

  def loose
      @question = Question.find(params[:question])
      flash.now[:alert] = "Miss..."
      render 'loose'
  end

  def check
    @lvl = params[:lvl].to_i
    answer_id = params[:id].to_i
    question = Question.find(params[:question])
    if @lvl == lvlmax
      render action: 'congrat' and return
    elsif answer_id == question.answer_id
      flash.now[:notice] = "Well done !"
      play
    else answer_id != question.answer_id
      loose
    end
  end

  private

  def lvlup(value)
    @lvl = 1 + value.to_i
  end
  def lvlmax
    @lvlmax = Question.all.count
  end

  def set_questions
    @questionsids = []
    Question.all.shuffle.each do |d|
      @questionsids << d.id
    end
    cookies[:questions] = @questionsids
  end

  def get_questions
    @questions = cookies[:questions].split('&')
  end

  def questions
    @questions = cookies[:questions]
  end

  def question
    @question = Question.find(questions[lvl])
  end

end



