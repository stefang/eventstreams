class StaticPagesController < ApplicationController
  def front
    @events = Event.all(:conditions => "published = true")
  end
end
