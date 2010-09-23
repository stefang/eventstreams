class AddDomainNameToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :custom_domain, :string
  end

  def self.down
    remove_column :events, :custom_domain
  end
end
