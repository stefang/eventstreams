class TalksController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @talks = @event.owned_talks.find(:all, :order => "start")
    else
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @talks = @event.owned_talks.find(:all, :conditions => "published = true")
        render :layout => 'event'
      end
    end
  end
  
  def show
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @talk = Talk.find(params[:id])
      @speakers = @talk.speakers.all
      @videos = @talk.owned_videos.all
    else
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @event_pages = @event.owned_event_pages.find(:all, :conditions => "published = true")
        @talk = @event.owned_talks.find(params[:id], :scope => @event)
        @speakers = @talk.speakers.find(:all, :conditions => "published = true")
        @videos = @talk.owned_videos.find(:all, :conditions => "published = true")
        render :layout => 'event'
      end
    end
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @venues = @event.owned_venues.all
    @tracks = @event.owned_tracks.all
    @speakers = @event.owned_speakers.all
    @talk = Talk.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @speakers = @event.owned_speakers.all
    @tracks = @event.owned_tracks.all
    @talk = Talk.new(params[:talk])
    @talk.start = "#{params[:start_date]} #{params[:start_hour]}:#{params[:start_min]}"
    @talk.event_id = @event.id
    if @talk.save
      flash[:notice] = "Successfully created talk."
      redirect_to user_event_talks_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @venues = @event.owned_venues.all
    @tracks = @event.owned_tracks.all
    @speakers = @event.owned_speakers.all
    @talk = @event.owned_talks.find(params[:id], :scope => @event)
    @videos = @talk.owned_videos.all
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @speakers = @event.owned_speakers.all
    @talk = @event.owned_talks.find(params[:id], :scope => @event)
    params[:talk][:start] = "#{params[:start_date]} #{params[:start_hour]}:#{params[:start_min]}"
    if @talk.update_attributes(params[:talk])
      flash[:notice] = "Successfully updated talk."
      redirect_to user_event_talks_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:id], :scope => @event)
    @talk.destroy
    flash[:notice] = "Successfully destroyed talk."
    redirect_to user_event_talks_path(current_user, @event)
  end
end
