# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = find_test_passage
    result = call_gist_service

    handle_result(result)
    redirect_to @test_passage
  end

  private

  def find_test_passage
    TestPassage.find(params[:test_passage_id])
  end

  def call_gist_service
    GistQuestionService.new(@test_passage.current_question).call
  end

  def handle_result(result)
    if result.success?
      flash[:notice] = success_massage(result)
      create_gist(result)
    else
      flash[:alert] = t('.failure')
    end
  end

  def success_massage(result)
    "#{view_context.link_to('Gist', result.html_url, target: '_blank', rel: 'noopener')} #{t('.success')}"
  end

  def create_gist(result)
    Gist.create(
      gist_hash: result.id,
      gist_url: result.html_url,
      user: current_user,
      question: @test_passage.current_question
    )
  end
end
