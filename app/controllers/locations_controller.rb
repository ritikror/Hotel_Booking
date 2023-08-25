class LocationsController < ApplicationController
    before_action :set_params, only: [:show, :update, :destroy]
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
        @location = Location.new(location_params)
        if @location.save
        
          render json: @location
        else
          render json: {error: @location.errors.full_messages}
        end
      end
  
      def update
        if @location.update(location_params)
          render json: @location
        else
          render :update, status: :unprocessable_entity
        end  
      end
  
      def destroy
        @location.destroy
        render json:'User Deleted Succesfully..'
      end

	private
	def set_params
		@location = Location.find(params[:id])
	rescue
		render json: { error: "ID not found"}
	end

    private def location_params
      params.require(:location).permit(:name)
    end
end
