class ProblemsController < ApplicationController
	before_action :require_logged_in
	before_action :require_admin, only: [:new]
	#after_action :start_timer , only: [:index]
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
		@now= Time.now
		@end= @now + @question_paper.time_in_minutes * 60
		@timer = Timer.new
		@timer.start_time =@now
		@timer.end_time =@end
		@problems = @question_paper.problems
	end
	private 
		def problem_params
			params.require(:problem).permit(:question,:optionA,:optionB,:optionC,:optionD,:correct_choice)
		end
		def start_timer
			puts "**** params.inspect  "+params.inspect
			puts "***** start_timer ********************"			

			puts "********  @end = "+@end.to_s
		end
end