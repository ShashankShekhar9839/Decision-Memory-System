# Rails API controller responsible for creating a user (signup / registration)

class UsersController < ApplicationController
  def create
  user = User.new(user_params)
  if user.save
    # Only send back the ID, username, and email. NEVER the digest.
    render json: { 
      message: "User created successfully",  
      user: { 
        id: user.id, 
        username: user.username, 
        email: user.email 
      } 
    }, status: :created
  else
    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
  end
end

  private

  def user_params  
    params.require(:user).permit(:username, :email, :password)
  end
end
