class Event < ActiveRecord::Base
  attr_accessible :title, :subdomain, :year, :start_date, :end_date
  belongs_to :user
  validates_presence_of :title, :on => :create
  validates_presence_of :subdomain, :on => :create
  validates_uniqueness_of :subdomain, :on => :create
  has_many :owned_event_pages, :class_name => 'EventPage', :foreign_key => :event_id
  has_many :owned_tracks, :class_name => 'Track', :foreign_key => :event_id

end
