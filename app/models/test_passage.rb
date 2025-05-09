# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESSFUL_PASS = 85

  belongs_to :user

  belongs_to :test

  belongs_to :current_question,
              class_name: 'Question',
              optional: true

  before_validation :set_first, on: :create

  scope :succesfull, -> { where(success: true) }

  def success_true
    update(success: true)
  end

  def question_number
    test.questions.index(current_question) + 1
  end

  def total_questions
    test.questions.count
  end

  def successful?
    result >= SUCCESSFUL_PASS
  end

  def result
    correct_questions.to_f * 100 / test.questions.count
  end

  def done?
    current_question.nil? || time_is_out?
  end

  def time_is_out?
    return if self.test.passing_time.nil?
    ((self.created_at + self.test.passing_time * 60) - Time.now) <= 0
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct?(answer_ids)

    self.current_question = next_question
    save!
  end

  private

  def set_first
    self.current_question = test.questions.first if test.present?
  end

  def correct?(answer_ids)
    return if self.current_question.answers.empty?
    right_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def right_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
