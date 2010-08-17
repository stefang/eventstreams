class Speaker < ActiveRecord::Base
  
  has_attached_file :portrait, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  belongs_to :talk

  validates_presence_of :name, :on => :create
  validates_presence_of :talk_id, :on => :create
end
