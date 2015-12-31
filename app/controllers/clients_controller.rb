class ClientsController < ApplicationController
	before_action :login_home

	def index
		@clients = Client.all
	end
	def show
		@client = Client.find(params[:id])
	end
	def create
		Client.create_demo
		redirect_to action: :index, controller: "clients"
	end
	def destroy
		Client.destroy_all
		redirect_to action: :index, controller: "clients"
	end
end
