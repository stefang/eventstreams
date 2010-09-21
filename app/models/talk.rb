class Talk < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event
  
  belongs_to :track
  belongs_to :venue
  belongs_to :event
  has_and_belongs_to_many :speakers
  has_many :owned_videos, :class_name => 'Video', :foreign_key => :talk_id, :dependent => :destroy
  
  validates_presence_of :title, :on => :create
  
end
