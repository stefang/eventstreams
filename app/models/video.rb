class Video < ActiveRecord::Base
  attr_accessible :title, :description, :vimeo_id, :talk_id, :published

  belongs_to :talk

end
