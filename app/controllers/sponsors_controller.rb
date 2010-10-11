class SponsorsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    if current_subdomain.blank?
      @event = current_user.owned_events.find(params[:event_id])
      @sponsors = @event.owned_sponsors.all
    else
      get_published_or_owned_event
      render :layout => 'event'
    end

  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @sponsor = @event.owned_sponsors.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    check_url
    @sponsor = @event.owned_sponsors.new(params[:sponsor])
    if @sponsor.save
      flash[:notice] = "Successfully created sponsor."
      redirect_to user_event_sponsors_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @sponsor = @event.owned_sponsors.find(params[:id], :scope => @event)
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    check_url
    @sponsor = @event.owned_sponsors.find(params[:id], :scope => @event)
    if @sponsor.update_attributes(params[:sponsor])
      flash[:notice] = "Successfully updated sponsor."
      redirect_to user_event_sponsors_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @sponsor = @event.owned_sponsors.find(params[:id], :scope => @event)
    @sponsor.destroy
    flash[:notice] = "Successfully destroyed sponsor."
    redirect_to user_event_sponsors_path(current_user, @event)
  end
  
  def update_order
    current_item = 1
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item = Sponsor.find(e.split("=")[1])
      item.item_order = current_item
      item.save
      current_item += 1
    end
    render :text => "Sponsor order saved"
  end
  
  def check_url
    if !params[:sponsor][:url].blank? && !params[:sponsor][:url].match(/^http:\/\//i)
        params[:sponsor][:url] = "http:\/\/#{params[:sponsor][:url]}"
    end
  end
  
  
end
