class Event < ActiveRecord::Base
  attr_accessible :title, :subdomain, :year, :start_date, :end_date, :hashtag, :published

  belongs_to :user

  validates_presence_of :title, :on => :create
  validates_presence_of :subdomain, :on => :create
  validates_uniqueness_of :subdomain, :on => :create

  has_many :owned_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy
  has_many :published_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy, :conditions=>{:published => true}
  has_many :owned_tracks, :class_name => 'Track', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_talks, :class_name => 'Talk', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_venues, :class_name => 'Venue', :foreign_key => :event_id, :dependent => :destroy
end