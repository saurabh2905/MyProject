class SessionsController < ApplicationController
	def new
		if session[:user]!= nil
			@user=session[:user]
			redirect_to user_path(@user["id"])
		else
			return
		end
	end
	def validLogin
		@user=User.where("email = ? AND password = ?",params[:user][:email],params[:user][:password]).first
		if @user.blank?
			puts "fail"
			redirect_to new_session_path
		else
			puts "success"
			session[:user]=@user
			redirect_to user_path(@user)
		end
	end
	def logout
		puts "*** logout"
		session.clear
		redirect_to new_session_path
	end	
	def relogin		
	end
end