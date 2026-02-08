class FollowsController < ApplicationController
  def create
    follower = User.find(params[:follower_id])
    followed = User.find(params[:followed_id])
    
    # Using the helper method we wrote in the User model
    if follower.follow(followed)
      render json: { message: "Followed successfully" }, status: :created
    else
      # FIX: Ensure there is NO SPACE before the colon after 'status'
      render json: { error: "Could not follow user" }, status: :unprocessable_entity
    end
  end

  def destroy
    # We use params[:followed_id] because that's what's sent from React
    follower = User.find(params[:follower_id])
    followed = User.find(params[:followed_id])
    
    if follower.unfollow(followed)
      head :no_content
    else
      render json: { error: "Could not unfollow" }, status: :unprocessable_entity
    end
  end
end