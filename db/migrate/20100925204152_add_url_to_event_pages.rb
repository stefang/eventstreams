class AddUrlToEventPages < ActiveRecord::Migration
  def self.up
    add_column :event_pages, :external_url, :string
  end

  def self.down
    remove_column :event_pages, :external_url
  end
end
