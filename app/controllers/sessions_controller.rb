class SessionsController < ApplicationController
	skip_before_filter :require_login, only: [:create, :new]
	def new
		if session[:username]
			redirect_to home_path
		end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# Sign the user in and redirect to the user's show page.
			session[:username] = user.username
			session[:userid] = user.id

			redirect_to home_path
		else
			# Create an error message and re-render the signin form.
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		session[:username] = nil
		redirect_to root_url
	end
end
