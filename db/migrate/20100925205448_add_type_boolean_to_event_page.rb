class AddTypeBooleanToEventPage < ActiveRecord::Migration
  def self.up
    add_column :event_pages, :page_type, :boolean
  end

  def self.down
    remove_column :event_pages, :page_type
  end
end
