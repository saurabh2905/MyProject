class UsersController < ApplicationController
	before_action :require_logged_in , only: [:my_profile]
	def new
		session.clear
	end
	def create
		@user= User.new(params.require(:user).permit(:email,:password,:password_confirmation))
		if @user.save
			session[:user]=@user
			redirect_to users_my_profile_path		
		else
			render "new"
		end
	end
	def my_profile
		@user = User.find(session[:user]["id"].to_s)
	end
end