class AddTwitterUserIdToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :twitter_user_id, :integer
  end

  def self.down
    remove_column :tweets, :twitter_user_id
  end
end
