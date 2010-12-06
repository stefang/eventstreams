class AddLocationToEventMenus < ActiveRecord::Migration
  def self.up
    add_column :event_menus, :location, :string
  end

  def self.down
    remove_column :event_menus, :location
  end
end
