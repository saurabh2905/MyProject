class SolutionsController < ApplicationController
	before_action :require_logged_in
	def create
		params2=params.except(:"authenticity_token",:"utf8",:"commit",:"controller",:"action",:"submitted_solution",:"question_paper_id")
		@user = User.find(session[:user]["id"])
		@solution = @user.solutions.new()
		@solution.question_paper_id = params[:submitted_solution]["question_paper_id"]
		@solution.save
		params2.each { |key, value| 
			@answer= @solution.answers.new
			@answer.problem_id  = key.to_i
			@answer.submitted_choice = value[0]
			if @answer.save
				puts "*** answer saved"
			else
				puts "*** answer not saved"
			end 	 		
		}
		@solution.score
		redirect_to solutions_path
	end
	def index
		@user = User.find(session[:user]["id"])
		@solutions = @user.solutions.order(updated_at: :desc)
	end
end