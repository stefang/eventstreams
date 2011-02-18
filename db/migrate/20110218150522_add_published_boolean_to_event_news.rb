class AddPublishedBooleanToEventNews < ActiveRecord::Migration
  def self.up
    add_column :event_news_items, :published, :boolean
  end

  def self.down
    remove_column :event_news_items, :published
  end
end