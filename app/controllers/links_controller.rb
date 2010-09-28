class LinksController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def new
    @event = current_user.owned_events.find(params[:event_id])
    @link = @event.owned_links.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @link = @event.owned_links.new(params[:link])
    if @link.save
      flash[:notice] = "Successfully created link."
      redirect_to user_event_event_pages_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @link = @event.owned_links.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @link = @event.owned_links.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "Successfully updated link."
      redirect_to user_event_event_pages_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    destroy_event_menu_item @link
    flash[:notice] = "Successfully destroyed link."
    redirect_to user_event_event_pages_path(current_user, @event)
  end
end
