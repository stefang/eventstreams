class SpeakersController < ApplicationController

  before_filter :authenticate

  def index
    @event = current_user.owned_events.find(params[:event_id])
    @speakers = @event.owned_speakers.all
  end
  
  def show
    @event = current_user.owned_events.find(params[:event_id])
    @speaker = @event.owned_speakers.find(params[:id])
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
    @speaker = @event.owned_speakers.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @speaker = @event.owned_speakers.find(params[:id])
    if @speaker.update_attributes(params[:speaker])
      flash[:notice] = "Successfully updated speaker."
      redirect_to user_event_speakers_url(current_user, params[:event_id])
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    flash[:notice] = "Successfully destroyed speaker."
    redirect_to user_event_speakers_url(current_user, params[:event_id])
  end
end
