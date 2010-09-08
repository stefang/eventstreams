class AddTwitterAccountToEvent < ActiveRecord::Migration
  def self.up
     add_column :events, :twitter_account, :string
   end

   def self.down
     remove_column :events, :twitter_account
   end
end
