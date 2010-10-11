class RemoveDescriptionAndCreateUrlForSponsor < ActiveRecord::Migration
  def self.up
    remove_column :sponsors, :descrption
    add_column :sponsors, :url, :string
  end

  def self.down
    add_column :sponsors, :descrption, :text
    remove_column :sponsors, :url
  end
end
