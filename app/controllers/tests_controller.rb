class TestsController < ApplicationController
  def index
    @tests = Test.pluck(:id, :title).sort
    render plain: @tests
  end

  def show
    render plain: @tests.inspect
  end
end
