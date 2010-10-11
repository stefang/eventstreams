class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.string :cached_slug
      t.text :descrption
      t.integer :event_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sponsors
  end
end
