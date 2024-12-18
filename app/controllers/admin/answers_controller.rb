# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController
  before_action :set_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show; end

  def edit; end

  def new; 
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to admin_answer_path(@answer), notice: 'Answer was created!'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), notice: 'Answer was updated!'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_answer_path(@answer)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
