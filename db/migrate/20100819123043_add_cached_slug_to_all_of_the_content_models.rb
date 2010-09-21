class AddCachedSlugToAllOfTheContentModels < ActiveRecord::Migration
  def self.up
    add_column :venues, :cached_slug, :string
    add_column :venue_types, :cached_slug, :string
    add_column :talks, :cached_slug, :string
    add_column :speakers, :cached_slug, :string
    add_column :videos, :cached_slug, :string
    add_index  :venues, :cached_slug
    add_index  :venue_types, :cached_slug
    add_index  :talks, :cached_slug
    add_index  :speakers, :cached_slug
    add_index  :videos, :cached_slug
  end

  def self.down
    remove_column :venues, :cached_slug
    remove_column :venue_types, :cached_slug
    remove_column :talks, :cached_slug
    remove_column :speakers, :cached_slug
    remove_column :videos, :cached_slug
  end
end
