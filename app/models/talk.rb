class Talk < ActiveRecord::Base
  attr_accessible :title, :description, :start, :duration, :track_id, :published
  belongs_to :track
  
  validates_presence_of :title, :on => :create
  validates_presence_of :track_id, :on => :create
  
end
