module AnswersHelper
	def get_problem(answer)
		puts "**** answer id "+answer.problem_id.to_s
		@problem= Problem.find(answer.problem_id)
	end
end
