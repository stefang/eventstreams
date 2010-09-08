class SpeakersController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @speakers = @event.owned_speakers.all
    else
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @speakers = @event.owned_speakers.find(:all, :conditions => "published = true")
        render :layout => 'event'
      end
    end
  end
  
  def show
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @speaker = @event.owned_speakers.find(params[:id])
    else
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @speaker = @event.owned_speakers.find(params[:id], :conditions => "published = true", :scope => @event)
        render :layout => 'event'
      end
    end
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @speaker = @event.owned_speakers.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @speaker = Speaker.new(params[:speaker])
    @speaker.event_id = @event.id
    if @speaker.save
      flash[:notice] = "Successfully created speaker."
      redirect_to user_event_speakers_url(current_user, params[:event_id])
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @speaker = @event.owned_speakers.find(params[:id], :scope => @event)
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @speaker = @event.owned_speakers.find(params[:id], :scope => @event)
    if @speaker.update_attributes(params[:speaker])
      flash[:notice] = "Successfully updated speaker."
      redirect_to user_event_speakers_url(current_user, params[:event_id])
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @speaker = Speaker.find(params[:id], :scope => @event)
    @speaker.destroy
    flash[:notice] = "Successfully destroyed speaker."
    redirect_to user_event_speakers_url(current_user, params[:event_id])
  end
  
  def update_order
    current_item = 1
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item = Speaker.find(e.split("=")[1])
      item.item_order = current_item
      item.save
      current_item += 1
    end
    render :text => "Speaker order saved"
  end
  
end
