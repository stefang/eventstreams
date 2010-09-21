class AddPageOrderToEventPages < ActiveRecord::Migration
  def self.up
    add_column :event_pages, :page_order, :integer
  end

  def self.down
    remove_column :event_pages, :page_order
  end
end
