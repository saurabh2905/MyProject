class UsersController < ApplicationController
	def new
		session.clear
		@user= User.new	
	end
	def create
		puts params.inspect
		@user= User.new(params.require(:user).permit(:email,:password,:password_confirmation))
		if @user.save
			session[:user]=@user
			redirect_to user_path(@user)		
		else
			render "new"
		end
	end
	def show
		#puts "*** id1 : "+params[:id]
		#puts "*** id2 : "+session[:user]["id"].to_s
		if params[:id].to_i==session[:user]["id"]
			#puts "*** equal"
			@user = User.find(session[:user]["id"].to_s)
		else
			flash[:alert] ='You are trying to access other account'
			flash[:msg] = 'Other Account'
			redirect_to sessions_relogin_path
		end
		
	end
end