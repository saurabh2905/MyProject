class Answer < ApplicationRecord
	belongs_to :solution
	belongs_to :problem
	scope :correct , -> {
		joins(:problem).where('answers.submitted_choice = problems.correct_choice')
	}
end
