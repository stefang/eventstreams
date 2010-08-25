class TweetsController < ApplicationController

  before_filter :authenticate

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @tweets = @event.owned_tweets.find(:all, :limit => 20)
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      if @event.blank?
        render_404
      else
        @tweets = @event.owned_tweets.find(:all, :limit => 20)
        render :layout => 'event'
      end
    end
  end
end
