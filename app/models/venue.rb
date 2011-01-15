class Venue < ActiveRecord::Base
  
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event
  
  acts_as_mappable

  belongs_to :event
  belongs_to :venue_type

  validates_presence_of :name, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :postcode, :on => :create

  before_validation_on_create :geocode_address
  before_validation_on_update :geocode_address
  
  def inline_address
    
    address_array = [name, address_1, address_2, address_3, city, county, country, postcode]
    
    return address_array.compact.reject(&:blank?).join(", ")
    
    # = h venue.address_1
    # = h venue.address_2
    # = h venue.address_3
    # = h venue.city
    # = h venue.county
    # = h venue.country
    # = h venue.postcode
    
  end

  private
    def geocode_address
      address_array = [address_1, address_2, address_3, city, county, postcode]
      combined_address = address_array.compact.reject { |s| s.empty? }.join(', ')
      geo=Geokit::Geocoders::MultiGeocoder.geocode (combined_address)
      errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng = geo.lat, geo.lng if geo.success
    end
end
