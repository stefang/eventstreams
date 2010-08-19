class SpeakersController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit, :create, :update, :destroy]

  def index
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @speakers = @talk.owned_speakers.all
  end
  
  def show
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @speaker = @talk.owned_speakers.find(params[:id])
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @speaker = @talk.owned_speakers.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @speaker = Speaker.new(params[:speaker])
    @speaker.event_id = @event.id
    @speaker.talk_id = @talk.id
    if @speaker.save
      flash[:notice] = "Successfully created speaker."
      redirect_to user_event_talk_url(current_user, params[:event_id], params[:talk_id])
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @speaker = Speaker.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @speaker = Speaker.find(params[:id])
    if @speaker.update_attributes(params[:speaker])
      flash[:notice] = "Successfully updated speaker."
      redirect_to user_event_talk_url(current_user, params[:event_id], params[:talk_id])
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    flash[:notice] = "Successfully destroyed speaker."
    redirect_to user_event_talk_url(current_user, params[:event_id], params[:talk_id])
  end
end
