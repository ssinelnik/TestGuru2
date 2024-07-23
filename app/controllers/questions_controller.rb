class QuestionsController < ApplicationController
  def index
    questions = @question.questions
    render plain: questions.inspect
  end
end
