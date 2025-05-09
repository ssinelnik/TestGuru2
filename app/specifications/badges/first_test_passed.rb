# frozen_string_literal: true

module Badges
  class FirstTestPassed < BadgeRuleSpecification
    def satisfied?
      return false unless @test_passage.success?

      @title = @value
      user = @test_passage.user
      user.test_passage.user
      user.tests.where(title: @title).count == 1
    end
  end
end
