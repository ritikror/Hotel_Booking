class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :create, :login]
	skip_before_action :check_owner
	skip_before_action :check_customer

  def index
    users = User.all
    render json: users
  end

  def login
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { message: "Logged In Successfully..", token: token }
    else
      render json: { error: "Please Check your Email And Password....."}  
    end
  end
  end
  