class AddIndexToVenueLatLng < ActiveRecord::Migration
  def self.up
      add_index  :venues, [:lat, :lng]
    end

    def self.down
      remove_index  :venues, [:lat, :lng]
    end
end
