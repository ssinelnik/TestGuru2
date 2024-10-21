# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :set_test, only: %[create new]
  before_action :set_question, only: %[show update destroy edit]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def edit; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to admin_test_path(@question.test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'No resource'
  end
end
