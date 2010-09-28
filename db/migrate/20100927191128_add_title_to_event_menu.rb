class AddTitleToEventMenu < ActiveRecord::Migration
  def self.up
    add_column :event_menus, :title, :string
  end

  def self.down
    remove_column :event_menus, :title
  end
end
