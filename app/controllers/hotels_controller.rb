class HotelsController < ApplicationController
	skip_before_action :check_customer
	skip_before_action :check_owner, only: [:index, :search_hotel_by_location, :search_hotel_by_name ]
	before_action :set_params, only: [:show, :destroy]

 	def index
		hotels = hotels = Hotel.all
	  	render json: hotels 
 	end

 	def show
 		hotel = @current_user.hotels
		render json: hotel   
 	end

	def create
		hotel = @current_user.hotels.new(hotel_params)
		if hotel.save
		render json: hotel, status: :created
    else
      render json: { error: hotel.errors.full_messages }, status: :unprocessable_entity
    end
	end
		
	def destroy
		if @hotel
			@hotel.destroy
			render json: { message: "Hotel Deleted !!!" }, status: :ok
		end
	end

	def search_hotel_by_location
		name = params[:name]
		if name.blank?
			return render json: "Location can't be blank"
		end
		hotels = Hotel.joins(:location).where('locations.name like ?', "%#{name}%")
		render json: hotels
  	end

	def search_hotel_by_name
		name = params[:name]
		if name.blank?
			return render json: "Hotel name can't be blank"
		end
		hotel = Hotel.where("name LIKE ?", "%#{name}%")
		render json: hotel
	end
	
 	private
		def hotel_params
			params.permit(:name, :address, :contact, :status, :location_id)
		end

		def set_params
			@hotel = @current_user.hotels.find(params[:id])
		end
end
