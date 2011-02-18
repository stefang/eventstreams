class EventNewsItem < ActiveRecord::Base
  has_friendly_id :headline, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event

  belongs_to :event
  
  validates_presence_of :headline, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :item_date, :on => :create
  
end
