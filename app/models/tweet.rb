class Tweet < ActiveRecord::Base
  attr_accessible :twitter_id, :event_id, :text, :avatar
  validates_uniqueness_of :twitter_id
  default_scope :order => 'twitter_id DESC' 
end