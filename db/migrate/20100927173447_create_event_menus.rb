class CreateEventMenus < ActiveRecord::Migration
  def self.up
    create_table :event_menus do |t|
      t.string :type
      t.integer :item_id
      t.integer :event_id
      t.integer :item_order
      t.timestamps
    end
  end
  
  def self.down
    drop_table :event_menus
  end
end
