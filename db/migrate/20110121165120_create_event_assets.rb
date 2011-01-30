class CreateEventAssets < ActiveRecord::Migration
  def self.up
    create_table :event_assets do |t|
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :event_assets
  end
end
