class EventNewsItemsController < ApplicationController
  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @event_news_items = @event.owned_news_items.all
    else
      get_published_or_owned_event
      @event_news_items = @event.owned_news_items.find(:all, :conditions => "published = true")
      render :layout => 'event'
    end
  end
  
  def show
    get_published_or_owned_event
    @event_news_item = @event.published_news_items.find(params[:id], :conditions => "published = true", :scope => @event)
    render :layout => 'event'
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @event_news_item = @event.owned_news_items.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @event_news_item = @event.owned_news_items.new(params[:event_news_item])
    if @event_news_item.save
      flash[:notice] = "Successfully created event news item."
      redirect_to user_event_event_news_items_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @event_news_item = @event.owned_news_items.find(params[:id], :scope => @event)
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @event_news_item = @event.owned_news_items.find(params[:id], :scope => @event)
    if @event_news_item.update_attributes(params[:event_news_item])
      flash[:notice] = "Successfully updated event news item."
      redirect_to user_event_event_news_items_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @event_news_item = @event.owned_news_items.find(params[:id], :scope => @event)
    @event_news_item.destroy
    flash[:notice] = "Successfully deleted event news item."
    redirect_to user_event_event_news_items_path(current_user, @event)
  end
end
