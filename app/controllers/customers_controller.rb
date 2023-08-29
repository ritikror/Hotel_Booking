class CustomersController < ApplicationController
    skip_before_action :authenticate_request
    skip_before_action :check_customer
    skip_before_action :check_owner
        
    def index
        redirect_to "/hotels"
    end

    def open_hotel
        hotels = Hotel.where(status: "open")
        render json: hotels
    end
end
