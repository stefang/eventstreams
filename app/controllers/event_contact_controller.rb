class EventContactController < ApplicationController
  def index
    get_published_or_owned_event
    render :layout => 'event'
  end
  
  def create
    get_published_or_owned_event
    if Notification.deliver_contact(params, @event)
      flash[:notice] = "Email was successfully sent."
      redirect_to(contact_path)
    else
      flash.now[:error] = "An error occurred while sending this email."
      render :index
    end
  end  
end
