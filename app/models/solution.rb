class Solution < ApplicationRecord
	belongs_to :user , dependent: :destroy
	has_many :answers
	belongs_to :question_paper
	has_one :timer
	def score
		num_correct_answer= self.answers.correct.size
		num_problems=self.question_paper.problems.length
		percentage=((num_correct_answer.to_f/num_problems)*100).round(2)
		self.update_attributes(:score => percentage)
	end
end