class AddDescriptionToEvent < ActiveRecord::Migration
  def self.up
     add_column :events, :description, :text
   end

   def self.down
     remove_column :description, :tagline
   end
end
