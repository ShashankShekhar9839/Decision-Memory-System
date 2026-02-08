class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :active_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  
  has_many :passive_relationships, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # Helper methods 
  def follow(other_user) 
    following << other_user unless self == other_user || following.include?(other_user)
  end 

  def unfollow(other_user) 
    following.delete(other_user)
  end 
  
  def following?(other_user) 
    following.include?(other_user)
  end
  
  # --- UPDATED AS_JSON ---
  def as_json(options = {})
    super(options.merge(
      only: [:id, :username, :email],
      methods: [:following_ids, :followers_count, :following_count, :posts_count] # Added posts_count here
    ))
  end

  def followers_count
    followers.count
  end

  def following_count
    following.count
  end

  # --- ADDED POSTS_COUNT ---
  def posts_count
    posts.count
  end
end