class AddTypeToSponsor < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :type, :string, :default => "Sponsor"
  end

  def self.down
    remove_column :sponsors, :type
  end
end
