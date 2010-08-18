class TweetsController < ApplicationController
  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @tweets = @event.owned_tweets.all
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      if @event.blank?
        render_404
      else
        @tweets = @event.owned_tweets.all
        render :layout => 'event'
      end
    end
  end
end
