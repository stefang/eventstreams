class Speaker < ActiveRecord::Base
  attr_accessible :name, :biog, :event_id, :talk_id, :published

  belongs_to :talk

  validates_presence_of :name, :on => :create
  validates_presence_of :talk_id, :on => :create
end
