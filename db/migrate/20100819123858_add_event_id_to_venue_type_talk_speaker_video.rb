class AddEventIdToVenueTypeTalkSpeakerVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :event_id, :integer
  end

  def self.down
    remove_column :videos, :event_id
  end
end