class VideosController < ApplicationController
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
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
      @talk = @event.owned_talks.find(params[:talk_id])
      @video = Video.find(params[:id])
    end
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
    @video = Video.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @talk = @event.owned_talks.find(params[:talk_id])
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
    @talk = @event.owned_talks.find(params[:talk_id])
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
