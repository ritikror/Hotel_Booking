class UsersController < ApplicationController
  before_action :set_user,only:[:show,:update,:destroy]
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      render json: @user
    end

    def create
      @user = User.new(user_params)
      if @user.save
      
        render json: @user
      else
        render json: {error: @user.errors.full_messages}
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render :update, status: :unprocessable_entity
      end  
    end

    def destroy
      @user.destroy
      render json:'User Deleted Succesfully..'
    end

    private def set_user
      @user=User.find(params[:id])
    rescue
      render json: { error: "ID not found"}
    end

    private
    def user_params
      params.permit(:name, :email, :age, :mobile, :type, :password_digest)
    end

  end
  