class AddSuperadminBooleanToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :superadmin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :superadmin
  end
end
