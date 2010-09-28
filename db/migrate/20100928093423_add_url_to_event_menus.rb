class AddUrlToEventMenus < ActiveRecord::Migration
  def self.up
    add_column :event_menus, :url, :string
  end

  def self.down
    remove_column :event_menus, :url
  end
end
