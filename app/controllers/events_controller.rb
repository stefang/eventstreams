class EventsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show, :custom]
  before_filter :get_owned_event, :only => [:edit, :update, :destroy]
  
  def index
    if params[:user_id]
      @events = current_user.owned_events.all
    else
      @events = Event.all(:conditions => "published = true")
    end
  end
  
  def show
    if current_subdomain.blank?
      @event = get_owned_event
    else
      get_published_or_owned_event
      if @event.blank?
        render :layout => 'hidden_event', :action => 'hidden_event'
      else
        @speakers = @event.owned_speakers.find(:all, :conditions => "published = true AND portrait_file_name IS NOT NULL", :order => 'RAND()', :limit => 9)
        @venues = @event.owned_venues.find(:all, :conditions => "published = true AND main_venue = true")
        @tweets = @event.owned_tweets.find(:all, :limit => 5)
        render :layout => 'event'
      end
    end
  end
  
  def custom
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      render :content_type => "text/css"
    end
  end
  
  def new
    @event = current_user.owned_events.new()
  end
  
  def create
    check_twitter
    @event = current_user.owned_events.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to user_events_path(current_user)
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    check_twitter
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to edit_user_event_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to user_events_path(current_user)
  end

  def get_owned_event
    @event = current_user.owned_events.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:warning] = "Not authed"
      redirect_to '/'
  end
  
  private
  
  def check_twitter
    if !params[:event][:hashtag].blank? && !params[:event][:hashtag].match(/^#/i)
        params[:event][:hashtag] = "##{params[:event][:hashtag]}"
    end
    if !params[:event][:twitter_account].blank? && !params[:event][:twitter_account].match(/^@/i)
        params[:event][:twitter_account] = "@#{params[:event][:twitter_account]}"
    end
  end
end
