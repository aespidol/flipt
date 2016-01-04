class ClientsController < ApplicationController
	before_action :login_home

	# Show list of clients
	def index
		@clients = Client.all
	end

	# Show form form for specific client
	def show
		@client = Client.find(params[:id])
	end

	# Create demo data
	def create
		Client.create_demo
		redirect_to action: :index, controller: "clients"
	end

	# Destroy all demo data
	def destroy
		Client.destroy_all
		redirect_to action: :index, controller: "clients"
	end
end
