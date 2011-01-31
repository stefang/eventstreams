class VenuesController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @venues = @event.owned_venues.all
      @global_venue_types = VenueType.all(:conditions => "global = true")
    else
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @main_venues = @event.owned_venues.find(:all, :conditions => "published = true AND main_venue = true", :order => 'venue_type_id')
        @other_venues = @event.owned_venues.find(:all, :conditions => "published = true AND main_venue = false", :order => 'venue_type_id')
        render :layout => 'event'
      end
    end
  end
  
  def show
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.find(params[:id], :scope => @event)
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @venue_types = VenueType.all(:conditions => "global = true OR event_id = #{@event.id}")
    @venue = @event.owned_venues.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.new(params[:venue])
    @venue.event_id = @event.id
    
    if @venue.save
      flash[:notice] = "Successfully created venue."
      redirect_to user_event_venues_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @venue_types = VenueType.all(:conditions => "global = true OR event_id = #{@event.id}")
    @venue = @event.owned_venues.find(params[:id], :scope => @event)
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.find(params[:id], :scope => @event)
    if @venue.update_attributes(params[:venue])
      flash[:notice] = "Successfully updated venue."
      redirect_to user_event_venues_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @venue = Venue.find(params[:id], :scope => @event)
    @venue.destroy
    flash[:notice] = "Successfully destroyed venue."
    redirect_to user_event_venues_path
  end
end
