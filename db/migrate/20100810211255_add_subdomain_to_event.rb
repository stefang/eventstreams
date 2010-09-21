class AddSubdomainToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :subdomain, :string
  end

  def self.down
    remove_column :events, :subdomain
  end
end
