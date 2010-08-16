class EventsController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :get_owned_event, :only => [:edit, :update, :destroy]
  
  def index
    if params[:user_id]
      @events = current_user.owned_events.all
    else
      @events = Event.all
    end
  end
  
  def show
    if current_subdomain.blank?
      @event = get_owned_event
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      if @event.blank?
        render_404
      else
        render :layout => 'event'
      end
    end
  end
  
  def new
    @event = current_user.owned_events.new
  end
  
  def create
    @event = current_user.owned_events.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to current_user
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to current_user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to current_user
  end

  def get_owned_event
    @event = current_user.owned_events.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:warning] = "Not authed"
      redirect_to '/'
  end
  
end
