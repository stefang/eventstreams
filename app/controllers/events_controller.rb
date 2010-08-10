class EventsController < ApplicationController
  before_filter :authenticate, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :get_owned_event, :only => [:edit, :update, :destroy]
  
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = current_user.owned_events.new
    render :layout => 'admin'
  end
  
  def create
    @event = current_user.owned_events.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    render :layout => 'admin'
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to current_user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_url
  end
  
  def get_owned_event
    @story = current_user.owned_events.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:warning] = "Not authed"
      redirect_to '/'
  end
  
end
