class RenameTypeToItemTypeInEventMenu < ActiveRecord::Migration
  def self.up
    rename_column :event_menus, :type, :item_type
  end

  def self.down
    rename_column :event_menus, :item_type, :type
  end
end
