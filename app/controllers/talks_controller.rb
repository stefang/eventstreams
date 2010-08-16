class TalksController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit, :create, :update, :destroy]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @talks = @event.owned_talks.all
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
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
      @speakers = @talk.owned_speakers.all
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      if @event.blank?
        render_404
      else
        @event_pages = @event.owned_event_pages.find(:all, :conditions => "published = true")
        @talk = @event.owned_talks.find(params[:id])
        @speakers = @talk.owned_speakers.find(:all, :conditions => "published = true")
        render :layout => 'event'
      end
    end
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @venues = @event.owned_venues.all
    @tracks = @event.owned_tracks.all
    @talk = Talk.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @tracks = @event.owned_tracks.all
    @talk = Talk.new(params[:talk])
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
    @talk = @event.owned_talks.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:id])
    if @talk.update_attributes(params[:talk])
      flash[:notice] = "Successfully updated talk."
      redirect_to user_event_talks_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:id])
    @talk.destroy
    flash[:notice] = "Successfully destroyed talk."
    redirect_to user_event_talks_path(current_user, @event)
  end
end
