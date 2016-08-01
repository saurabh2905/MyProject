class LoginsController < ApplicationController
	def new
		session.clear
		@login= Login.new

	end
	def validLogin
		@login=Login.where("email = ? AND password = ?",params[:login][:email],params[:login][:password]).first
		if @login.blank?
			puts "fail"
			render "index"
		else
			puts "success"
			session[:login]=@login
			puts "****	 session #{session[:login]}"
			puts "**** id #{session[:login][:id]}"
			redirect_to login_path(@login)
		end
	end
	def index
		if session[:login]!= nil
			@login=session[:login]
			puts "*** index "
			puts @login.inspect
			puts "*** index email #{@login["email"]}"
			puts "*** index id #{@login["id"]}"
			redirect_to login_path(@login["id"])
		else
			return
		end
	end
	def create
		puts params.inspect
		@login= Login.new(params.require(:login).permit(:email,:password,:password_confirmation))
		if @login.save
			session[:login]=@login
			redirect_to login_path(@login)		
		else
			render "new"
		end
	end
	def show
		@login = Login.find(params[:id])
	end
	def logout
		puts "*** logout"
		session.clear
		render "index"
	end	
end
