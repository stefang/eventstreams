class AddTwitterUserNameToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :twitter_user_name, :string
  end

  def self.down
    remove_column :tweets, :twitter_user_name
  end
end
