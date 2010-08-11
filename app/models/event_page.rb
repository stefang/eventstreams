class EventPage < ActiveRecord::Base
  attr_accessible :title, :content, :event_id, :published
  belongs_to :event

  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create

end
