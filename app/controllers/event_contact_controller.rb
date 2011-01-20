class EventContactController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => :create
  
  def index
    get_published_or_owned_event
    render :layout => 'event'
  end
  
  def create
    get_published_or_owned_event
    if params[:message].blank? || params[:name].blank? || params[:email].blank?
      flash.now[:error] = "You must provide a name, email address and a message."
      render :layout => 'event', :action => :index      
    else
      if Notification.deliver_contact(params, @event)
        flash[:notice] = "Email was successfully sent."
        render :layout => 'event', :action => :index    
      else
        flash.now[:error] = "An error occurred while sending this email."
        render :layout => 'event', :action => :index    
      end
    end
  end  
end
