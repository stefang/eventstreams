class AddMainVenueBooleanToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :main_venue, :boolean, :default => false
  end

  def self.down
    remove_column :venues, :main_venue
  end
end
