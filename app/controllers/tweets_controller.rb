class TweetsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @tweets = @event.owned_tweets.find(:all, :limit => 20)
    else
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @tweets = @event.owned_tweets.find(:all, :limit => 20)
        render :layout => 'event'
      end
    end
  end

  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @tweet = Tweet.find(params[:id], :scope => @event)
    @tweet.destroy
    flash[:notice] = "Successfully destroyed tweet."
    redirect_to user_event_tweets_path(current_user, @event)
  end

end
