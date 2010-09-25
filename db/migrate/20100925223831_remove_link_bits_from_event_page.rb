class RemoveLinkBitsFromEventPage < ActiveRecord::Migration
  def self.up
    remove_column :event_pages, :external_url
    remove_column :event_pages, :page_type
  end

  def self.down
    add_column :event_pages, :external_url, :string
    add_column :event_pages, :page_type, :boolean
  end
end