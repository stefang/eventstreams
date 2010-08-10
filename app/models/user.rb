class User < ActiveRecord::Base
  include Clearance::User
  has_many :owned_events, :class_name => 'Event', :foreign_key => :user_id
end
