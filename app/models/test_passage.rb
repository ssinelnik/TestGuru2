# frozen_string_literal: true

class TestPassage < ApplicationRecord
	SUCCESSFUL_PASS = 85

	belongs_to :user

	belongs_to :test

	belongs_to :current_question, 
						  class_name: 'Question', 
							optional: true

	before_validation :set_first, on: :create

	# ??
	def question_number
		test.questions.index(current_question) + 1
	end

	# вернёт true, если больше 85%
	def successful?
		result >= SUCCESSFUL_PASS
	end


	# переводим в процент правильные ответы
	def result
		correct_questions.to_f * 100 / test.questions.count
	end

	# есть ли ещё вопросы в тесте
	def done?
		current_question.nil?
	end

	# ??
	def accept!(answer_ids)
		self.correct_questions += 1 if correct?(answer_ids)

		self.current_question = next_question
		save!
	end

	private

	# при начале прохождения теста устанавливаем текущий вопрос первым 
	def set_first
		self.current_question = test.questions.first if test.present?	
	end

	# проверка правильного ответа
	def correct?(answer_ids)
		right_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
	end

	# получить выборку правильныз ответов для текущего вопроса
	def right_answers
		current_question.answers.correct_answer
	end

	# следующий вопрос
	def next_question
		test.questions.order(:id).where('id > ?', current_question.id).first
	end
end