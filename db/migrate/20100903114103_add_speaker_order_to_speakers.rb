class AddSpeakerOrderToSpeakers < ActiveRecord::Migration
  def self.up
    add_column :speakers, :item_order, :integer
  end

  def self.down
    remove_column :speakers, :item_order
  end
end
