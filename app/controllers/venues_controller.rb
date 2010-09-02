class VenuesController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @venues = @event.owned_venues.all
      @global_venue_types = VenueType.all(:conditions => "global = true")
      @owned_venue_types = @event.owned_venue_types.all
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      if @event.blank?
        render_404
      else
        @venues = @event.owned_venues.find(:all, :conditions => "published = true")
        render :layout => 'event'
      end
    end
  end
  
  def show
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.find(params[:id])
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
    @venue = @event.owned_venues.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.find(params[:id])
    if @venue.update_attributes(params[:venue])
      flash[:notice] = "Successfully updated venue."
      redirect_to user_event_venues_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    flash[:notice] = "Successfully destroyed venue."
    redirect_to user_event_venues_path
  end
end
