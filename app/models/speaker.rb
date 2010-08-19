class Speaker < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event
  
  has_attached_file :portrait, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  belongs_to :talk
  belongs_to :event

  validates_presence_of :name, :on => :create
  validates_presence_of :talk_id, :on => :create
end
