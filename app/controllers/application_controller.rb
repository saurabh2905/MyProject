class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	def require_logged_in
		redirect_to new_session_path if session[:user].nil?
	end
	def require_admin
		if session[:user]["role"]!= "admin"
			render html: "<script>alert('Only Admin has Access !!')</script>".html_safe 
		end
	end
end
