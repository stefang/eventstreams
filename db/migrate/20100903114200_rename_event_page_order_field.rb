class RenameEventPageOrderField < ActiveRecord::Migration
  def self.up
    rename_column :event_pages, :page_order, :item_order
  end

  def self.down
    rename_column :event_pages, :item_order, :page_order
  end
end
