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
        @talks = @event.owned_talks.find(:all, :conditions => "published = true", :scope => @event, :order => 'start ASC')         
        @tracks = @event.owned_tracks.find(:all, :conditions => "published = true", :scope => @event, :order => 'item_order ASC')
        @track_days = @event.owned_talks.find(:all, :conditions => "published = true", :scope => @event, :order => 'start ASC', :group => 'DATE(start)')
        
        @programme = Array.new
        day = Array.new
        track = Array.new
        last_date = nil
        
        @tracks.each do |tr|
          track_talks = @talks.select {|t| t.track_id == tr.id}
          for maybe_day in @track_days
            day_talks = track_talks.select {|t| t.start.to_date == maybe_day.start.to_date}
            track << Array.new(day_talks) if day_talks.any?
            day_talks.clear
          end
          @programme << Array.new(track) if track.any?
          track.clear
        end
        
        untracked_talks = @talks.select {|t| t.track_id == nil}
        for maybe_day in @track_days
          day_talks = untracked_talks.select {|t| t.start.to_date == maybe_day.start.to_date}
          track << Array.new(day_talks) if day_talks.any?
          day_talks.clear
        end
        @programme << Array.new(track)
        track.clear
        
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
