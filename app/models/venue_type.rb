class VenueType < ActiveRecord::Base
  attr_accessible :name, :event_id
  validates_uniqueness_of :name, :on => :create
  
  has_many :venues, :class_name => 'Venue', :foreign_key => :venue_type_id
  
end
