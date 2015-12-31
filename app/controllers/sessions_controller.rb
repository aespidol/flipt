class SessionsController < ApplicationController
	before_action :login_home, except: [:destroy]

	def new
	end
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
	def destroy
		session[:user_id] = nil
		redirect_to action: :index, controller: "clients"
	end
end
