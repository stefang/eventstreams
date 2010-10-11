class Sponsor < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event
  
  has_attached_file :logo, :styles => { :original => "980x980", :medium => "460x300>", :thumb => "210x90>", :tiny => "42x42#" }, 
    :path => ":rails_root/assets/event_assets/:event_id/:attachment/:id/:style/:id",
    :url => "/event_assets/:event_id/:attachment/:id/:style/:id",
    :convert_options => {
        :all => "-strip", 
        :thumb => "-quality 92" 
    }

  belongs_to :event
  
  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :event_id
end
