class RenameTypeToTweetType < ActiveRecord::Migration
  def self.up
    rename_column :tweets, :type, :tweet_type
  end

  def self.down
    rename_column :tweets, :tweet_type, :type
  end
end
