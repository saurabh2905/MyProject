class QuestionPapersController < ApplicationController
	before_action :require_logged_in
	def index
		@question_papers = QuestionPaper.all
	end
end