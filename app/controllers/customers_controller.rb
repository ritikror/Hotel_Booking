class CustomersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    skip_before_action :check_customer, only: [:create]
    skip_before_action :check_owner
        
    def index
        redirect_to "/hotels"
    end

    def create
        customer = Customer.new(customer_params)
        if customer.save    
            render json: { message:"Customer Created!!!", data: customer }
        else
            render json: customer.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @current_user.update(customer_params)
        render json: { message: 'Customer updated' }
    end

    def destroy
        if @current_user.destroy
        render json: { message: 'Customer deleted' }, status: :deleted
        else
        render json: { message: 'Customer deletion failed' }
        end
    end

    def open_hotel
        hotels = Hotel.where(status: "open")
        render json: hotels
    end

    private
        def customer_params
        params.permit(:name, :email, :age, :mobile, :password)
        end

end
