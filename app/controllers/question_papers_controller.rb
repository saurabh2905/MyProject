class QuestionPapersController < ApplicationController
	before_action :require_logged_in
	before_action :require_admin, only: [:add_question, :index]
	before_action :require_subject, only: [:selected_list]
	before_action :require_submission, only: [:score]
	def add_question
			@question_paper= QuestionPaper.where("subject = ?",params[:problem][:subject])
			@id = @question_paper[0]["id"]
			puts "****** id "+ @id.to_s			
			@problem = Problem.new(params.require(:problem).permit(:question,:optionA,:optionB,:optionC,:optionD,:correct_choice,:subject))
			#puts "******* problem before "+@problem.inspect
			@problem["question_paper_id"]=@id
			#puts "******* problem after "+@problem.inspect
			if(@problem.save)
				puts "successful in adding question "
				redirect_to question_papers_path
			else
				puts "**** " + @problem.inspect
				render "new"
			end
	end
	def index
		@problems = Problem.all
	end
	def selected_list
		puts "params in selected_list : "+params.inspect
		subject=params[:selected_subject][:subject]
		puts "**** params received "+subject
		@question_paper=QuestionPaper.where("subject = ?",subject)
		@id= @question_paper[0]["id"]
		@problems= Problem.where("question_paper_id = ?",@id)
	end
	def choose_subject
	end
	def score
		count=0
		count_received=params[:submitted_solution]["count"].to_i
		#puts "****** count_received "+count_received.to_s
		params2=params.except(:"authenticity_token",:"utf8",:"commit",:"controller",:"action")
		params2.each { |key, value| 
			print key ," is ", value
			@problem=Problem.where("id = ? AND correct_choice = ?",key.to_i,value[0]).first
			if @problem.blank?
				print "**blank ",count
			else
				print "**success"
				count =count+1
			end
		}
		print "count",count
		print "**percentage ",count.to_f/count_received
		@percentage=(count.to_f/count_received * 100).round(2)
	end
	private 
		def require_logged_in
			redirect_to new_session_path if session[:user].nil?
		end
		def require_admin
				if session[:user]["role"]!= "admin"
				puts "********** public *********"
				flash[:alert] ='You are not the admin. Only admin can add Questions'
				flash[:msg] ='Admin'
				redirect_to sessions_relogin_path
			end
		end
		def require_subject
			redirect_to question_papers_choose_subject_path if !(params.key?("selected_subject"))
		end
		def require_submission
			redirect_to question_papers_selected_list if !(params.key?("submitted_solution"))
		end
end