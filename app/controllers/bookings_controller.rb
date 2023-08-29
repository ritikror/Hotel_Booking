class BookingsController < ApplicationController
    skip_before_action :check_owner
	before_action :set_params, only: [:show, :destroy]

	def create
		@booking = @current_user.bookings.new(booking_params)
		if @booking.save
			render json: { message: 'Room Booked successfully' }, status: :ok
		else
			render json: { error: @booking.errors.full_messages }, status: :unprocessable_entity
			return
		end		
	end
	

	def index
		bookings = @current_user.bookings
		return render json: { message: 'No Booking found' } unless bookings.present?
		render json: bookings, status: :ok
 	end


	def show
		return render json: @booking, status: :ok if @booking.present?
	end

	def destroy
		if @booking
			booking = @booking.destroy
			render json: { message: "Booking deleted" }, status: :ok	
		end
	end

	private
		def booking_params
			params.require(:bookings).permit(:customer_name, :mobile, :room_type, :member, :hotel_id, :room_id)
		  end

		def set_params
			@booking = Booking.find_by(id: params[:id])
			unless @booking
			  render json: { message: 'Booking not found' }, status: :not_found
			end
		end
end
