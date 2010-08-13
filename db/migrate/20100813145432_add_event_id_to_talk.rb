class AddEventIdToTalk < ActiveRecord::Migration
  def self.up
    add_column :talks, :event_id, :integer
  end

  def self.down
    remove_column :talks, :event_id
  end
end
