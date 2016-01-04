class ProspectsController < ApplicationController
	before_action :require_login, only: [:show]
	respond_to :html, :xml, :json

	# Create new prospect name
	def create
		client = Client.find(params[:id])
		@prospect = client.prospects.create( name: params[:name] )
		render json: @prospect.id
	end

	#Show user dashboard
	def show
		@client = Client.find(session[:user_id])
		@prospect = Client.find(session[:user_id]).prospects.order(created_at: :asc)
	end

	# Update prospect profile with phone number
	def update
		Prospect.find(params[:prospect_id]).update(phone: params[:phone])
		redirect_to "/clients"
	end

	# Destroy individual prospect
	def destroy
		Prospect.find(params[:id]).destroy
		redirect_to action: :show, controller: "prospects"
	end
end
