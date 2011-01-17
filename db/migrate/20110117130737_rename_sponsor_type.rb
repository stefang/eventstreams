class RenameSponsorType < ActiveRecord::Migration
  def self.up
    rename_column :sponsors, :type, :sponsor_type
  end

  def self.down
    rename_column :sponsors, :sponsor_type, :type
  end
end
