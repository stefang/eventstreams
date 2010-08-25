class User < ActiveRecord::Base
  include Clearance::User
  has_attached_file :avatar, :styles => { :medium => "176x176#", :thumb => "88x88#", :tiny => "22x22#" }, 
    :path => ":rails_root/public/system/:attachment/:id/:style/:id.jpg", 
    :url => "/system/:attachment/:id/:style/:id.jpg",
    :default_url => '/images/default_avatar.jpg'

  has_many :owned_events, :class_name => 'Event', :foreign_key => :user_id, :dependent => :destroy

  attr_accessible :first_name
  attr_accessible :last_name
  attr_accessible :nickname
  attr_accessible :avatar
  
  attr_readonly :superadmin
  
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create
  
  def superadmin?
    superadmin
  end

end