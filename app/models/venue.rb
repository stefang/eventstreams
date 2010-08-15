class Venue < ActiveRecord::Base
  
  acts_as_mappable
  
  attr_accessible :name, :description, :address_1, :address_2, :address_3, :city, :county, :postcode, :lat, :lng, :website, :phone_number, :published
  belongs_to :event

  validates_presence_of :name, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :postcode, :on => :create

  before_validation_on_create :geocode_address

  private
    def geocode_address
      address_array = [address_1, address_2, address_3, city, county, postcode]
      combined_address = address_array.compact.reject { |s| s.empty? }.join(', ')
      geo=Geokit::Geocoders::MultiGeocoder.geocode (combined_address)
      errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng = geo.lat, geo.lng if geo.success
    end
end
