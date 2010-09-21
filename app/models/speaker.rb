class Speaker < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event
  
  has_attached_file :portrait, :styles => { :original => "980x980", :medium => "300x300#", :thumb => "100x88#" }, 
    :path => ":rails_root/assets/event_assets/:event_id/:attachment/:id/:style/:filename",
    :url => "/event_assets/:event_id/:attachment/:id/:style/:filename"

  has_and_belongs_to_many :talks
  belongs_to :event

  validates_attachment_size :portrait, :less_than=>1.megabyte
  validates_attachment_content_type :portrait, :content_type=>['image/jpeg', 'image/png', 'image/gif']

  validates_presence_of :name, :on => :create
  validates_presence_of :event_id, :on => :create
end