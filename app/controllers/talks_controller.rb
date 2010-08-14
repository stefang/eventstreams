class TalksController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit, :create, :update, :destroy]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @talks = @event.owned_talks.all
    else
      @event = Event.find_by_subdomain(current_subdomain)
      @talks = @event.owned_talks.find(:all, :conditions => "published = true")
      render :layout => 'event'
    end
  end
  
  def show
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @talk = Talk.find(params[:id])
    else
      @event = Event.find_by_subdomain(current_subdomain)
      @talk = @event.owned_talks.find(params[:id])
    end
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @tracks = @event.owned_tracks.all
    @talk = Talk.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @tracks = @event.owned_tracks.all
    @talk = Talk.new(params[:talk])
    @talk.event_id = @event.id
    if @talk.save
      flash[:notice] = "Successfully created talk."
      redirect_to user_event_talks_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @tracks = @event.owned_tracks.all
    @talk = @event.owned_talks.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:id])
    if @talk.update_attributes(params[:talk])
      flash[:notice] = "Successfully updated talk."
      redirect_to user_event_talks_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:id])
    @talk.destroy
    flash[:notice] = "Successfully destroyed talk."
    redirect_to user_event_talks_path(current_user, @event)
  end
end
