class UsersController < ApplicationController
	skip_before_filter :require_login

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "You may login now."
			redirect_to root_path
		else 
			render 'new'
		end
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
