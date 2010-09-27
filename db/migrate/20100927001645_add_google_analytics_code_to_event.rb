class AddGoogleAnalyticsCodeToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :google_analytics, :string
  end

  def self.down
    remove_column :events, :google_analytics
  end
end
