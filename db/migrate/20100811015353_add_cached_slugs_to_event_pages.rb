class AddCachedSlugsToEventPages < ActiveRecord::Migration
  def self.up
    add_column :event_pages, :cached_slug, :string
    add_index  :event_pages, :cached_slug
  end

  def self.down
    remove_column :event_pages, :cached_slug
  end
end
