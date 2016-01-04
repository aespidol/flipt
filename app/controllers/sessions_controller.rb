class SessionsController < ApplicationController
	before_action :login_home, except: [:destroy]

	# Show login page
	def new
	end

	# Set session user_id
	def login
		client = Client.find_by(email: params[:email])
		if client
			if client.authenticate(params[:password_digest]) == false
				flash[:notice] = "Invalid Login Credentials"
				redirect_to :back
			else
				session[:user_id] = client.id
				redirect_to action: :show, controller: "prospects"
			end
		else
			flash[:notice] = "Invalid Login Credentials"
			redirect_to :back
		end
	end

	# Destroy session user_id
	def destroy
		session[:user_id] = nil
		redirect_to action: :index, controller: "clients"
	end
end
