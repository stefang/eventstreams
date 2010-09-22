class AddCountryStringToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :country, :string
  end

  def self.down
    remove_column :venues, :country
  end
end
