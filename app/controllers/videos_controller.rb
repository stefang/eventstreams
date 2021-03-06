class VideosController < ApplicationController
  
  before_filter :authenticate, :except => [:index, :show]
  
  def index
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @videos = Video.all
  end
  
  def show
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @talk = @event.owned_talks.find(params[:talk_id])
      @video = Video.find(params[:id])
    else
      get_published_or_owned_event
      @talk = @event.owned_talks.find(params[:talk_id], :scope => @event)
      @video = Video.find(params[:id])
      render :layout => 'event'
    end
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id], :scope => @event)
    @video = Video.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id], :scope => @event)
    @video = Video.new(params[:video])
    @video.talk_id = @talk.id
    @video.event_id = @event.id
    if @video.save
      flash[:notice] = "Successfully created video."
      redirect_to edit_user_event_talk_url(current_user, params[:event_id], params[:talk_id])
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id], :scope => @event)
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      flash[:notice] = "Successfully updated video."
      redirect_to edit_user_event_talk_url(current_user, params[:event_id], params[:talk_id])
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Successfully destroyed video."
    redirect_to edit_user_event_talk_url(current_user, params[:event_id], params[:talk_id])
  end
end
