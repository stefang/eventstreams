class AddEventIdAndPaperclipToEventAsset < ActiveRecord::Migration
  def self.up
    add_column :event_assets, :event_id, :integer
    add_column :event_assets, :asset_file_name,    :string
    add_column :event_assets, :asset_content_type, :string
    add_column :event_assets, :asset_file_size,    :integer
    add_column :event_assets, :asset_updated_at,   :datetime
    
  end

  def self.down
    remove_column :event_assets, :event_id
    remove_column :event_assets, :asset_file_name
    remove_column :event_assets, :asset_content_type
    remove_column :event_assets, :asset_file_size
    remove_column :event_assets, :asset_updated_at
  end
end
