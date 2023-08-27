class ApplicationController < ActionController::API
    include JsonWebToken
	  
	before_action :authenticate_request
	before_action :check_owner
	before_action :check_customer

    private
		def authenticate_request
			begin
				header = request.headers[ 'Authorization' ]
				header = header.split(" ").last if header
				decoded = jwt_decode(header)
				@current_user = User.find(decoded[:user_id])
			rescue JWT::DecodeError => e
				render json: { error: 'Invalid token' }, status: :unprocessable_entity
			end
			rescue ActiveRecord::RecordNotFound
				render json: "No record found.."
		end

		def current_user
			@current_user
		end
	  

		def check_owner
			return render json: { message: "You are not owner" } unless @current_user.type == 'Owner'
		end

		def check_customer
			return render json: { message: "You are not customer" } unless @current_user.type == 'Customer'
		end

		def search_hotel_by_name
	    hotels = Hotel.where("name like ?", "%"+params[:name]+"%")
		end

		def render_404
			render json: { error: "Invalid URL" }, status: :not_found
		end		 
	  
end
