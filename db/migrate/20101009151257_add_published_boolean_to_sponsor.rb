class AddPublishedBooleanToSponsor < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :item_order, :integer
    add_column :sponsors, :published, :boolean
    
  end

  def self.down
    remove_column :sponsors, :item_order
    remove_column :sponsors, :published
  end
end
