class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
   
    add_index :follows, :follower_id
    add_index :follows, :followed_id

    # this prevents duplicate follows (User A follows User B only once)
    add_index :follows, [:followed_id, :followed_id], unique: true

  end
  
end
