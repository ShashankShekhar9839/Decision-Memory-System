class PostsController < ApplicationController
    
    def index 
        posts = Post.all.order(created_at: :desc)
        # render json: posts.as_json(include: {user: {only: [:username]}})
        render json: posts.as_json(include: { 
        user: { only: [:id, :username] } 
  })

   end
   
   def create 
    post = Post.new(post_params)
    if(post.save) 
        render json: post.as_json(include: {user: {only: [:username]}}), status: :created
    else 
        render json: {error: post.errors.full_messages}, status: :unprocessable_entity
    end
end

  def destroy
  post = Post.find(params[:id])
  post.destroy
  head :no_content # Sends a 204 success status with no body
   end

  def update 
    post = Post.find(params[:id])
    if(post.update(post_params))
        render json: post.as_json(include: {user: {only: [:username]}})
    else 
        render json: {error: post.errors.full_messages}, status: :unprocessable_entity
    end
end

 private 

 def post_params 
    params.require(:post).permit(:title, :content, :user_id)
 end

end
