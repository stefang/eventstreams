class User < ActiveRecord::Base
  include Clearance::User

  has_many :owned_events, :class_name => 'Event', :foreign_key => :user_id, :dependent => :destroy

  attr_readonly :superadmin
  
  def superadmin?
    superadmin
  end

end