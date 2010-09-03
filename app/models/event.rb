class Event < ActiveRecord::Base
  attr_accessible :title, :subdomain, :year, :start_date, :end_date, :hashtag, :published, :description

  belongs_to :user

  validates_presence_of :title, :on => :create
  validates_presence_of :subdomain, :on => :create
  validates_uniqueness_of :subdomain, :on => :create

  has_many :owned_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_speakers, :class_name => 'Speaker', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_tracks, :class_name => 'Track', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_talks, :class_name => 'Talk', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_venues, :class_name => 'Venue', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_venue_types, :class_name => 'VenueType', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_tweets, :class_name => 'Tweet', :foreign_key => :event_id, :dependent => :destroy

  has_many :published_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy, :conditions=>{:published => true}, :order => 'item_order'
  
  def display_date
    range = start_date .. end_date
    range.to_s(:condensed)
  end
  
  def browser_title
    if tagline
      "#{title} | #{tagline}"
    else
      title
    end
  end
  
end