class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    # .authenticate is the magic method from has_secure_password
    if user&.authenticate(params[:password])
      # On success, send back user info
      render json: { 
        message: "Login successful", 
        user: user.as_json
      }, status: :ok
    else
      # On failure, send an error
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end