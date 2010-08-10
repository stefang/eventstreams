class Event < ActiveRecord::Base
  attr_accessible :title, :year, :start_date, :end_date
  belongs_to :user
  validates_presence_of :title, :on => :create
end
