class EventPagesController < ApplicationController
  def index
    @event = current_user.owned_events.find(params[:event_id])
    @event_pages = @event.owned_event_pages.all
  end
  
  def show
    @event = Event.find_by_subdomain(current_subdomain)
    @event_page = EventPage.find(params[:id])
    render :layout => 'event'
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = @event.owned_event_pages.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = EventPage.new(params[:event_page])
    @event_page.event_id = @event.id
    if @event_page.save
      flash[:notice] = "Successfully created event page."
      redirect_to user_event_event_pages_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = EventPage.find(params[:id])
  end
  
  def update
    @event_page = EventPage.find(params[:id])
    if @event_page.update_attributes(params[:event_page])
      flash[:notice] = "Successfully updated event page."
      redirect_to user_event_event_pages_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event_page = EventPage.find(params[:id])
    @event_page.destroy
    flash[:notice] = "Successfully destroyed event page."
    redirect_to event_pages_url
  end
end
