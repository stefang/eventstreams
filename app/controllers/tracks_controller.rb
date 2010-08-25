class TracksController < ApplicationController
  
  before_filter :authenticate
  
  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @tracks = @event.owned_tracks.all
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      if @event.blank?
        render_404
      else
        @tracks = @event.owned_tracks.find(:all, :conditions => "published = true")
        render :layout => 'event'
      end
    end
  end
  
  def show
    @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
    if @event.blank?
      render_404
    else
      @track = @event.owned_tracks.find(params[:id], :conditions => "published = true")
      render :layout => 'event'
    end
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @track = @event.owned_tracks.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @track = Track.new(params[:track])
    @track.event_id = @event.id
    if @track.save
      flash[:notice] = "Successfully created track."
      redirect_to user_event_tracks_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @track = Track.find(params[:id])
  end
  
  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      flash[:notice] = "Successfully updated track."
      redirect_to user_event_tracks_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    flash[:notice] = "Successfully destroyed track."
    redirect_to user_event_tracks_path(current_user, @event)
  end
end
