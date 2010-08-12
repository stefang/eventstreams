class AddCachedSlugsToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :cached_slug, :string
    add_index  :tracks, :cached_slug
  end

  def self.down
    remove_column :tracks, :cached_slug
  end
end
