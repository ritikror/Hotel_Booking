class BookingsController < ApplicationController
    skip_before_action :check_owner
	before_action :set_params, only: [:show, :destroy]

	def create
		hotel = Hotel.find_by(id: params[:bookings][:hotel_id])
		member = params[:bookings][:member].to_i
		required_rooms = (member / 2) + (member % 2)
		rooms = hotel.rooms.where(status: "available").where(room_category: params[:bookings][:room_type])
		avl_rooms = rooms.count
	
		if avl_rooms < required_rooms
		  render json: { message: "Rooms not available" }, status: :not_found
		else
		  rooms = rooms.limit(required_rooms)
	
		  rooms.each do |room|
			@booking = @current_user.bookings.new(booking_params)
			(member > 1) ? @booking.member = 2 : @booking.member = 1
			member -= 2
	
			if @booking.save
			  room.update(status: 'unavailable')
			else
			  render json: { error: @booking.errors.full_messages }, status: :unprocessable_entity
			  return
			end
		  end
	
		  render json: { message: 'Room Booked successfully' }, status: :ok
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
