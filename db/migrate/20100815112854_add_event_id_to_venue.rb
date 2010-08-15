class AddEventIdToVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :event_id, :integer
  end

  def self.down
    remove_column :venues, :event_id
  end
end
