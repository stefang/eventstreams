class AddCachedSlugsToEventNewsItems < ActiveRecord::Migration
  def self.up
    add_column :event_news_items, :cached_slug, :string
    add_index  :event_news_items, :cached_slug
  end

  def self.down
    remove_column :event_news_items, :cached_slug
  end
end
