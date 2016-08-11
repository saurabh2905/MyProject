class ProblemsController < ApplicationController
	before_action :require_subject, only: [:index]
	before_action :require_logged_in
	before_action :require_admin, only: [:new]
	def create
		@question_papers= QuestionPaper.where("subject = ?",params[:subject])
		@problem = @question_papers[0].problems.new(problem_params)
		if(@problem.save)
				puts "successful in adding question "
				flash[:alert]="Problem added successfully"		
				redirect_to new_problem_path
		else
			render "new"
		end		
	end
	def index
		@question_paper = QuestionPaper.find(params[:id])
		@problems = @question_paper.problems
	end
	
	private 
		def problem_params
			params.require(:problem).permit(:question,:optionA,:optionB,:optionC,:optionD,:correct_choice)
		end
		def require_subject
			redirect_to question_papers_path if params[:id].nil?	
		end
		
end
