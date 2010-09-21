class AddPublishedBooleanToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :published, :boolean
  end

  def self.down
    remove_column :tracks, :published
  end
end
