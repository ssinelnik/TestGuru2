# frozen_string_literal: true

module QuestionsHelper
	def question_header(question)
		# if question.new_record?
		# 	'Create new question'
		# else
		# 	'Edit question'
		# end

		intro = question.new_record? ? 'Create New' : 'Edit'
    "#{intro} #{question.test.title} question"
	end
end
