class Track < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event

  belongs_to :event
  has_many :owned_talks, :class_name => 'Talk', :foreign_key => :track_id, :dependent => :destroy
  has_many :published_talks, :class_name => 'Talk', :foreign_key => :track_id, :dependent => :destroy, :conditions=>{:published => true}  
  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
end