class QuestionPapersController < ApplicationController
	def new
	end
	def add_question
			@problem = Problem.new(params.require(:problem).permit(:question,:optionA,:optionB,:optionC,:optionD,:correct_choice))
			if(@problem.save)
				puts "successful in adding question "
				redirect_to question_papers_path
			else
				render "new"
			end
			#render "new"
	end
	def index
		#puts Problem.all
		@problems = Problem.all
		#render json: @problems
	end
	def show 
	end
	def score
		puts "score"
		puts params.inspect
		puts "******"
		puts params["1"]
		puts "tttttt"
		count=0
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
		print "**Total no. of rows ",
		a=Problem.count
		print "count",count
		print "**percentage ",count.to_f/a
		@percentage=(count.to_f/a * 100).round(2)
	end
end
