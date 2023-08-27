class RoomsController < ApplicationController
    skip_before_action :check_customer
  
  def create
    room = Room.new(room_params)
    if room.save
      render json: room, status: :created
    else
      render json: { data: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def room_list_by_hotel_id
    rooms = Room.where(hotel_id: params[:hotel_id])
    render json: rooms, status: :ok
  end

  private

  def room_params
    params.permit(:room_number, :room_category, :status, :occupency, :hotel_id)
  end
end
