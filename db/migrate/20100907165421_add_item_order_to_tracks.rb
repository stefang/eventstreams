class AddItemOrderToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :item_order, :integer
  end

  def self.down
    remove_column :tracks, :item_order
  end
end
