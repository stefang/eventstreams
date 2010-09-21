class TracksController < ApplicationController
  
  before_filter :authenticate, :except => [:index, :show]
  
  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @tracks = @event.owned_tracks.all
    else
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @tracks = @event.owned_tracks.find(:all, :conditions => "published = true")
        @untracked_talks = @event.owned_talks.find(:all, :conditions => "published = true AND (track_id IS NULL)", :scope => @event, :order => 'start ASC')
        render :layout => 'event'
      end
    end
  end
  
  def show
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @track = @event.owned_tracks.find(params[:id], :conditions => "published = true", :scope => @event)
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
    @track = Track.find(params[:id], :scope => @event)
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @track = Track.find(params[:id], :scope => @event)
    if @track.update_attributes(params[:track])
      flash[:notice] = "Successfully updated track."
      redirect_to user_event_tracks_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @track = Track.find(params[:id], :scope => @event)
    @track.destroy
    flash[:notice] = "Successfully destroyed track."
    redirect_to user_event_tracks_path(current_user, @event)
  end
  
  def update_order
    current_item = 1
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item = Track.find(e.split("=")[1])
      item.item_order = current_item
      item.save
      current_item += 1
    end
    render :text => "Track order saved"
  end
  
end
