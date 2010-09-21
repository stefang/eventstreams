class AddTwitterTypeToTweet < ActiveRecord::Migration
  def self.up
    add_column :tweets, :type, :string
  end

  def self.down
    remove_column :tweets, :type
  end
end
