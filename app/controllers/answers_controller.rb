class AnswersController < ApplicationController
	before_action :require_logged_in
	def index
		@solution= Solution.find(params["id"].to_i)
		@answers= @solution.answers
	end
end
