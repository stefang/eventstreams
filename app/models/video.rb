class Video < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true, :scope => :event

  belongs_to :talk
  belongs_to :event

end
