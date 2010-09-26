class Link < ActiveRecord::Base
  attr_accessible :title, :url, :event_id, :published
end
