class SessionsController < ApplicationController
	def new
		if session[:user]!= nil
			@user=session[:user]
			redirect_to users_my_profile_path
		end
	end
	def valid_login
		puts "********** request.inspect   "+response.inspect
		@user=User.where("email = ? ",params[:user][:email]).first
		if @user.try(:authenticate, params[:user][:password])
			session[:user]=@user
			redirect_to users_my_profile_path
		else
			redirect_to new_session_path
		end
	end
	def logout
		session.clear
		redirect_to new_session_path
	end	
end