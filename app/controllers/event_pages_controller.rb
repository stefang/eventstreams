class EventPagesController < ApplicationController

  before_filter :authenticate
  
  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @event_pages = @event.owned_event_pages.all
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      @event_pages = @event.owned_event_pages.find(:all, :conditions => "published = true")
      render :layout => 'event'
    end
  end
  
  def show
    @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
    @event_pages = @event.owned_event_pages.find(:all, :conditions => "published = true")
    @event_page = @event.owned_event_pages.find(params[:id], :conditions => "published = true")
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
    @event_page = @event.owned_event_pages.find(params[:id])
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
    redirect_to user_event_event_pages_path(current_user, @event)
  end

  def update_order
    current_page = 1
    page_order = params[:page_order].split("&")
    page_order.each do |e|
      event_page = EventPage.find(e.split("=")[1])
      event_page.page_order = current_page
      event_page.save
      current_page += 1
    end
    render :text => "Page order saved"
  end

end
