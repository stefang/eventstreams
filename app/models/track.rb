class Track < ActiveRecord::Base
  attr_accessible :title, :description, :event_id

  belongs_to :event

  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
end