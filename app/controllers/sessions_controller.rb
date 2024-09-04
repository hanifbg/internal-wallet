class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :create ]

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { message: "Login Successfully" }, status: :ok
    else
      render json: { message: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: "Logout Successfully" }, status: :ok
  end
end
