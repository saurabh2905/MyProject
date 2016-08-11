class SessionsController < ApplicationController
	def new
		if session[:user]!= nil
			@user=session[:user]
			redirect_to users_my_profile_path
		end
	end
	def valid_login
		@user=User.where("email = ? AND password = ?",params[:user][:email],params[:user][:password]).first
		if @user.blank?
			redirect_to new_session_path
		else
			session[:user]=@user
			redirect_to users_my_profile_path
		end
	end
	def logout
		session.clear
		redirect_to new_session_path
	end	
end