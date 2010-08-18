class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :twitter_id
      t.integer :event_id
      t.string :text
      t.string :avatar
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tweets
  end
end
