class Speaker < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event
  
  has_attached_file :portrait, :styles => { :medium => "300x300#", :thumb => "100x88#" }, 
    :path => ":rails_root/assets/event_assets/:event_id/:attachment/:id/:style/:filename",
    :url => "/event_assets/:event_id/:attachment/:id/:style/:filename"

  has_and_belongs_to_many :talks
  belongs_to :event

  validates_presence_of :name, :on => :create
  validates_presence_of :event_id, :on => :create
end