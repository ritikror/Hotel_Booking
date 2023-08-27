class LocationsController < ApplicationController
	skip_before_action :authenticate_request
	skip_before_action :check_customer
	skip_before_action :check_owner
	before_action :set_params, only: [:show]
	
	def index
		locations = Location.all
		render json: locations, status: :ok
	end

	def show
		if @location
			render json: @location, status: :ok
		end
	end

	def create
		location = Location.new(location_params)
		if location.save
		render json: { message:"Location Created", data: location }
		else
		render json: { errors: location.errors.full_messages }
		end
	end

	private

	def location_params
		params.permit(:name)
	end

	def set_params
		@location = Location.find(params[:id])
	rescue
		render json: { error: "ID not found"}
	end
end
