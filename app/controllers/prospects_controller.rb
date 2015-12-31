class ProspectsController < ApplicationController
	before_action :require_login, only: [:show]
	respond_to :html, :xml, :json
	def create
		client = Client.find(params[:id])
		@prospect = client.prospects.create( name: params[:name] )
		render json: @prospect.id
	end
	def show
		@client = Client.find(session[:user_id])
		@prospect = Client.find(session[:user_id]).prospects.order(created_at: :asc)
	end
	def update
		Prospect.find(params[:prospect_id]).update(phone: params[:phone])
		redirect_to "/clients"
	end
	def destroy
		Prospect.find(params[:id]).destroy
		redirect_to action: :show, controller: "prospects"
	end
end
