class Follow < ApplicationRecord
    # These point to the User Model, but we use custom names 
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
end
