class VenueType < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event

  validates_uniqueness_of :name, :on => :create
  
  belongs_to :event
    
end