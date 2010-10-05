class AddBookingUrlToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :booking_url, :string
  end

  def self.down
    remove_column :events, :booking_url
  end
end
