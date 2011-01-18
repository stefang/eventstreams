class AddContactDescriptionToEvent < ActiveRecord::Migration
  def self.up
     add_column :events, :contact_description, :text
   end

   def self.down
     remove_column :events, :contact_description
   end
end
