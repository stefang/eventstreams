class Talk < ActiveRecord::Base
  attr_accessible :title, :description, :start, :duration, :track_id, :venue_id, :published
  
  belongs_to :track
  belongs_to :venue
  has_many :owned_speakers, :class_name => 'Speaker', :foreign_key => :talk_id, :dependent => :destroy
  
  validates_presence_of :title, :on => :create
  validates_presence_of :track_id, :on => :create
  
end
