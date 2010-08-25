class VenueTypesController < ApplicationController
  
  before_filter :authenticate

  def new
    @event = current_user.owned_events.find(params[:event_id])
    @venue_type = VenueType.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @venue_type = VenueType.new(params[:venue_type])
    @venue_type.event_id = @event
    if @venue_type.save
      flash[:notice] = "Successfully created venue type."
      redirect_to user_event_venues_url(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @venue_type = @event.owned_venue_types.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @venue_type = @event.owned_venue_types.find(params[:id])
    if @venue_type.update_attributes(params[:venue_type])
      flash[:notice] = "Successfully updated venue type."
      redirect_to user_event_venues_url(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @venue_type = @event.owned_venue_types.find(params[:id])
    @venue_type.destroy
    flash[:notice] = "Successfully destroyed venue type."
    redirect_to user_event_venues_url(current_user, @event)
  end
end
