class EventAsset < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_attachment_presence :asset

  has_attached_file :asset, :styles => { :original => "2000x2000>", :thumb => "100x100#", :tiny => "40x40#" }, 
    :path => ":rails_root/assets/event_assets/:event_id/:attachment/:id/:style/:basename.:extension",
    :url => "/event_assets/:event_id/:attachment/:id/:style/:basename.:extension",
    :convert_options => {
         :all => "-strip -colorspace RGB", 
         :thumb => "-quality 82", 
         :tiny => "-quality 82" 
    }

end