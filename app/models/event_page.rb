class EventPage < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event
  
  belongs_to :event
  
  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
  
end
