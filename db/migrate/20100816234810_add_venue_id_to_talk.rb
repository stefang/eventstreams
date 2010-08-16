class AddVenueIdToTalk < ActiveRecord::Migration
  def self.up
    add_column :talks, :venue_id, :integer
  end

  def self.down
    remove_column :talks, :venue_id
  end
end
